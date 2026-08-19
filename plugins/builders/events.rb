# frozen_string_literal: true

module Builders
  # Every row in `src/_data/events.yml` carries photo sets that, until now, were
  # only ever rendered for the single event featured on the homepage. This builder
  # gives every event its own page at `/eventos/<slug>/` so the whole archive is
  # reachable, and exposes `all_events` / `event_path` to the templates.
  class Events < SiteBuilder
    # The whole archive, newest first. Index 0 is also what the homepage features
    # as "Próximo evento" — it appears in both places by design, so the archive is
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

    def build
      generator :add_event_pages

      helper(:all_events) { Events.all_events(site) }
      helper(:event_path) { |event| "/eventos/#{Events.slug_for(event)}/" }
    end

    def add_event_pages
      Events.all_events(site).each do |ev|
        work = present_in_source(ev.photos)
        event_shots = present_in_source(ev[:event_photos])

        add_resource :pages, "eventos/#{Events.slug_for(ev)}.html" do
          layout       :event
          title        ev.presenter
          tagline      ev.tagline
          description  ev.tagline
          image        ev.cover
          event        ev
          photos       work
          event_photos event_shots
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
