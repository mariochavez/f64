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
    # ("1ro de febrero 2023", "5 de abril 2023 (Miércoles)"), which is why it was
    # never parsed. But `<time datetime>` and Event schema both need a machine
    # date, so derive one here rather than duplicating it in the data file. A row
    # that fails to parse simply gets no machine date — never a wrong one.
    def self.iso_date_for(event)
      match = event.date.to_s.match(/(\d{1,2})\s*(?:ro|o|º|°)?\s*de\s+([[:alpha:]]+)\s+(\d{4})/i)
      return nil unless match

      day, month_name, year = match.captures
      month = MONTHS[month_name.to_s.downcase]
      return nil unless month

      Date.new(year.to_i, month, day.to_i).iso8601
    rescue Date::Error
      nil
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
