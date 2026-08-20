# frozen_string_literal: true

module Builders
  # Every row in `src/_data/events.yml` carries photo sets that, until now, were
  # only ever rendered for the single event featured on the homepage. This builder
  # gives every event its own page at `/eventos/<slug>/` so the whole archive is
  # reachable, and exposes `all_events` / `event_path` to the templates.
  class Events < SiteBuilder
    # The whole archive, newest first. Index 0 is also what the homepage features
    # as "Último evento" — it appears in both places by design, so the archive is
    # never missing the most recent session.
    def self.all_events(site)
      site.data.events
    end

    # The presenter's name is the URL. A row may set an explicit `slug:` to
    # override it, so a name can be corrected later without breaking a live URL.
    def self.slug_for(event)
      override = event[:slug]
      return override if override.is_a?(String) && !override.strip.empty?

      Bridgetown::Utils.slugify(event.presenter, mode: "latin")
    end

    MONTHS = {
      "enero" => 1, "febrero" => 2, "marzo" => 3, "abril" => 4,
      "mayo" => 5, "junio" => 6, "julio" => 7, "agosto" => 8,
      "septiembre" => 9, "setiembre" => 9, "octubre" => 10,
      "noviembre" => 11, "diciembre" => 12
    }.freeze

    # `date` is a free-text Spanish string chosen for how it reads on the page
    # ("6 de febrero de 2020"), which is why it was never parsed. The `de` before
    # the year is optional in this pattern: the file has since been normalised to
    # include it, but a row written the older way must still parse rather than
    # silently losing its machine date. But `<time datetime>` and Event schema both need a machine
    # date, so derive one here rather than duplicating it in the data file. A row
    # that fails to parse simply gets no machine date — never a wrong one.
    def self.iso_date_for(event)
      match = event.date.to_s.match(/(\d{1,2})\s*(?:ro|o|º|°)?\s*de\s+([[:alpha:]]+)\s+(?:de\s+)?(\d{4})/i)
      return nil unless match

      day, month_name, year = match.captures
      month = MONTHS[month_name.to_s.downcase]
      return nil unless month

      Date.new(year.to_i, month, day.to_i).iso8601
    rescue Date::Error
      nil
    end

    DAYS = %w[domingo lunes martes miércoles jueves viernes sábado].freeze

    # f/64 was a Thursday series, so the three sessions that fell on another day
    # are worth marking. That note used to be hand-written into a single row as
    # `5 de abril 2023 (Miércoles)` and was simply missing from the other two;
    # deriving it from the machine date annotates the register uniformly, which
    # is the only way a register should annotate anything.
    def self.weekday_note_for(event)
      iso = iso_date_for(event)
      return nil unless iso

      wday = Date.parse(iso).wday
      return nil if wday == 4

      DAYS[wday]
    rescue Date::Error
      nil
    end

    MONTH_NAMES = [nil, "enero", "febrero", "marzo", "abril", "mayo", "junio", "julio",
                   "agosto", "septiembre", "octubre", "noviembre", "diciembre"].freeze

    # A session that ran on schedule is roughly a month after the one before it.
    # Anything past this is a stop, not a rhythm.
    HIATUS_MONTHS = 6

    UNDATED = "Sin fecha"

    # A session's public number counts from the beginning of the series, so the
    # first talk is 1 and the last is 30 — the opposite of the storage order.
    # Keyed by slug because the events are plain hashes and several share values.
    def self.numbers_for(events)
      total = events.size
      events.each_with_index.to_h { |event, index| [slug_for(event), total - index] }
    end

    # Group the archive into years, newest first, and mark the boundary where the
    # series actually stopped. An unexplained hole in a reverse-chronological
    # register reads as lost data rather than as something that happened, and the
    # 33-month silence from March 2020 is the only gap in the whole file that is
    # longer than two months.
    def self.years_for(events)
      entries = events.group_by { |event| iso_date_for(event)&.slice(0, 4) || UNDATED }
                      .map { |year, list| { "year" => year, "anchor" => anchor_for(year), "events" => list } }

      entries.each_with_index do |entry, index|
        following = entries[index + 1]
        entry["hiatus"] = following ? hiatus_between(entry["events"].last, following["events"].first) : nil
      end
    end

    # `resumed` is the oldest session of the newer year; `paused` is the newest
    # session of the older one. Both come straight from the data, so the note can
    # never claim a reason the archive does not record.
    def self.hiatus_between(resumed, paused)
      from = iso_date_for(paused)
      to = iso_date_for(resumed)
      return nil unless from && to

      last_session = Date.parse(from)
      next_session = Date.parse(to)
      months = (next_session.year * 12 + next_session.month) - (last_session.year * 12 + last_session.month)
      return nil if months <= HIATUS_MONTHS

      "No hubo sesiones entre #{month_year(last_session)} y #{month_year(next_session)}."
    rescue Date::Error
      nil
    end

    # Every row parses today, but a future one that doesn't must not emit
    # `id="anio-Sin fecha"` — an id with a space that no anchor can reach.
    def self.anchor_for(year)
      year == UNDATED ? "sin-fecha" : year
    end

    # Every row's `address` is written "8pm en <lugar>" — a listing's grammar for
    # an event that is years past. Split it so the page can name the venue as a
    # venue and put the hour in the past tense, without rewriting thirty strings.
    def self.venue_for(event)
      event.address.to_s.sub(/\A\s*\d{1,2}\s*(?:am|pm)\s+en\s+/i, "").strip
    end

    def self.start_time_for(event)
      event.address.to_s[/\A\s*(\d{1,2}\s*(?:am|pm))/i, 1]
    end

    def self.month_year(date)
      "#{MONTH_NAMES[date.month]} de #{date.year}"
    end

    # The tagline alone made a poor meta description: several are a bare fragment
    # ("Fotógrafo de naturaleza", 23 characters) and several run past 300. Lead
    # with who and where, then as much of the tagline as fits in a SERP snippet.
    def self.description_for(event)
      prefix = "#{event.presenter} en f/64 Colima, #{event.date}."
      truncate("#{prefix} #{event.tagline}".squeeze(" ").strip, 155)
    end

    def self.truncate(text, limit)
      return text if text.length <= limit

      "#{text[0, limit + 1][/.*\s/m].to_s.strip.sub(/[.,;:—-]\z/, "")}…"
    end

    def build
      generator :add_event_pages

      helper(:all_events) { Events.all_events(site) }
      helper(:event_path) { |event| "/eventos/#{Events.slug_for(event)}/" }
      helper(:event_iso_date) { |event| Events.iso_date_for(event) }
      helper(:event_weekday_note) { |event| Events.weekday_note_for(event) }
      helper(:archive_years) { Events.years_for(Events.all_events(site)) }
      helper(:event_number) { |event| Events.numbers_for(Events.all_events(site))[Events.slug_for(event)] }
      helper(:event_venue) { |event| Events.venue_for(event) }
      helper(:event_start_time) { |event| Events.start_time_for(event) }
    end

    def add_event_pages
      events = Events.all_events(site)

      events.each_with_index do |ev, index|
        work = present_in_source(ev.photos)
        event_shots = present_in_source(ev[:event_photos])
        iso_date = Events.iso_date_for(ev)

        # The archive is stored newest-first, so the neighbour at index-1 is the
        # later session. Linking both ways gives every event page three inbound
        # links instead of the single one it had from `/eventos/`, and chains the
        # whole archive together for a crawler.
        newer = index.positive? ? events[index - 1] : nil
        older = events[index + 1]

        add_resource :pages, "eventos/#{Events.slug_for(ev)}.html" do
          layout       :event
          title        ev.presenter
          tagline      ev.tagline
          description  Events.description_for(ev)
          image        ev.cover
          event        ev
          photos       work
          event_photos event_shots
          iso_date     iso_date
          weekday_note Events.weekday_note_for(ev)
          number       Events.numbers_for(events)[Events.slug_for(ev)]
          total        events.size
          year         iso_date&.slice(0, 4)
          links        ev[:links] || []
          newer_event  newer
          older_event  older
        end
      end
    end

    private

    # Guard against a row referencing an image that isn't in the repo — as Anylú
    # Villalvazo y David Ayala's set was — so a page never renders a broken `<img>`.
    def present_in_source(paths)
      all = paths || []
      all.select { |path| File.exist?(site.in_source_dir(path)) }.tap do |kept|
        missing = all.size - kept.size
        next unless missing.positive?

        Bridgetown.logger.warn("Events:", "#{missing} image(s) not found in src, skipped")
      end
    end
  end
end
