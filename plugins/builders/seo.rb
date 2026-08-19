# frozen_string_literal: true

module Builders
  # The archive's 30 event pages each carry exactly one internal link, from
  # `/eventos/`, and the site had no sitemap at all — so discovery rested
  # entirely on a crawler walking that one index. This builder emits
  # `/sitemap.xml` covering every indexable page.
  #
  # Deliberately minimal: `<changefreq>` and `<priority>` are documented by
  # Google as ignored, so emitting them would only be noise. Deliberately not
  # the `bridgetown-sitemap` gem either — it emits `hreflang` alternates on
  # every URL, which on a single-locale Spanish site is at best redundant.
  class Seo < SiteBuilder
    # `/404` and `/500` are error documents: reachable, but never a search result.
    EXCLUDED_IDS = %w(/404 /500).freeze

    def build
      # `:pre_render` at low priority runs after every generator, so the event
      # pages added by `Builders::Events` are already in the pages collection.
      hook :site, :pre_render, priority: :low do |site|
        next if site.generated_pages.any? { |page| page.data.permalink == "/sitemap.xml" }

        site.generated_pages << sitemap_page(site)
      end
    end

    private

    def sitemap_page(site)
      page = Bridgetown::GeneratedPage.new(site, site.source, "/", "sitemap.xml", from_plugin: true)
      page.content = sitemap_xml(site)
      page.data.layout = "none"
      page.data.permalink = "/sitemap.xml"
      page.data.sitemap = false
      page
    end

    def sitemap_xml(site)
      entries = indexable_resources(site).map do |resource|
        <<~XML.strip
          <url>
            <loc>#{escape site.config.url + resource.relative_url.to_s}</loc>
            <lastmod>#{last_modified(site, resource)}</lastmod>
          </url>
        XML
      end

      <<~XML
        <?xml version="1.0" encoding="UTF-8"?>
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
        #{entries.join("\n")}
        </urlset>
      XML
    end

    def indexable_resources(site)
      site.collections.pages.resources.reject do |resource|
        EXCLUDED_IDS.include?(resource.id.to_s) ||
          resource.data.sitemap == false ||
          resource.data.published == false
      end.sort_by { |resource| resource.relative_url.to_s }
    end

    # Event pages know the day the talk happened, which is a far more honest
    # `lastmod` for an archive than the moment CI happened to run.
    def last_modified(site, resource)
      iso = resource.data.iso_date
      return "#{iso}T00:00:00#{site.time.strftime("%:z")}" if iso

      (resource.data.last_modified_at || site.time).to_time.xmlschema
    end

    def escape(text)
      text.to_s.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
          .gsub('"', "&quot;").gsub("'", "&apos;")
    end
  end
end
