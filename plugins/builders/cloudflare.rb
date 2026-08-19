# frozen_string_literal: true

module Builders
  # Cloudflare serves every static asset with `public, max-age=0,
  # must-revalidate`, so even the content-hashed bundles pay a revalidation
  # round trip on each navigation. `/_headers` overrides that for the things
  # whose URL changes when their content does, and leaves HTML on the
  # revalidating default so a published edit is live immediately.
  #
  # This is generated rather than kept as `src/_headers` because Bridgetown
  # skips underscore-prefixed entries in `src/`, and force-including one through
  # the `include:` config key copies it only intermittently — the file would
  # silently vanish from some builds and the cache policy with it.
  class Cloudflare < SiteBuilder
    RULES = {
      # Hashed by esbuild: a changed file is a changed URL, so it can never go stale.
      "/_bridgetown/static/*" => "public, max-age=31536000, immutable",
      # Photographs are only ever added, never edited in place.
      "/images/*" => "public, max-age=604800",
      "/*.png" => "public, max-age=604800",
      "/*.ico" => "public, max-age=604800",
      "/*.svg" => "public, max-age=604800",
    }.freeze

    def build
      hook :site, :pre_render, priority: :low do |site|
        next if site.generated_pages.any? { |page| page.data.permalink == "/_headers" }

        site.generated_pages << headers_page(site)
      end
    end

    private

    def headers_page(site)
      page = Bridgetown::GeneratedPage.new(site, site.source, "/", "_headers", from_plugin: true)
      page.content = headers_file
      page.data.layout = "none"
      page.data.permalink = "/_headers"
      page.data.sitemap = false
      page
    end

    def headers_file
      RULES.map { |path, cache_control| "#{path}\n  Cache-Control: #{cache_control}\n" }.join("\n")
    end
  end
end
