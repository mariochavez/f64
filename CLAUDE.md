# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`f64.io` — the static site for **f/64**, a monthly photography talk series in Colima, Mexico.
Built with **Bridgetown 2**, ERB templates, **Tailwind CSS 4**, esbuild, and Hotwire
(Turbo + Stimulus), on **Ruby 4.0** and **Yarn 4**. All user-facing copy is **Spanish**
(`lang: es`, timezone `Guadalajara`).

There is no test suite and no application server in production — the site builds to static
HTML in `output/` and is deployed to Cloudflare.

## Commands

```sh
bundle install && yarn install   # setup (Yarn 4 via corepack; package.json pins the version)

bin/bridgetown start             # dev server + esbuild watch → http://localhost:4000
bin/bridgetown console           # IRB with the site loaded
bin/bridgetown deploy            # clean + frontend build + site build (same as `rake`)

bundle exec rake test            # build with BRIDGETOWN_ENV=test (a build, not a test suite)
bundle exec rake publish         # production build + checks + wrangler deploy to Cloudflare
```

Ruby 4.0.0, pinned in `.ruby-version`.
There is no lint task wired into the bundle — `.rubocop.yml` and `.standard.yml` are
**symlinks into `~/Development/neovim-files/`**, so editing them changes every project that
links them.

## Architecture

**Content lives in `src/`.** Bridgetown's `template_engine` is `erb`, so `.md` pages under
`src/` are ERB-first: front matter, then a body that freely mixes Markdown and ERB with full
Tailwind markup inline (see `src/index.md`).

**Bridgetown 2 ships without ActiveSupport** — `present?`, `presence` and `blank?` do not exist
in templates or plugins. `_head.erb` defines a local `first_present` lambda for the
"front matter, else site metadata" fallback; use plain Ruby elsewhere. `html_safe` *is*
available, and `<%== %>` emits unescaped output (`<%= %>` escapes).

**Front matter is YAML**, so an unquoted value containing `: ` silently parses to nothing rather
than raising — a description written as `Archivo de f/64: 30 pláticas…` disappears from the
build with no error.

**`src/_data/events.yml` is the site's database** — 30 talks, Nov 2018 to Dec 2023. Every entry
has `presenter`, `date` (a free-text Spanish string, not a parsed date), `address`, `tagline`,
`copyright`, `cover`, a `photos` array (the photographer's work, © presenter) and, for most,
`event_photos` (audience/session shots, © f/64). Order is **reverse-chronological and
load-bearing**: `src/index.md` reads `site.data.events.first` as the *last* event and
`slice(1..8)` as earlier ones, while `/eventos/` lists all 30. The builder also uses the order
to derive each event page's prev/next neighbours.
Adding a new event means prepending to this file and dropping images under `src/images/<slug>/`
plus a cover at `src/images/events/<slug>.jpg`.

**`plugins/builders/events.rb` turns each past event into a page** at `/eventos/<slug>/`, and
supplies the `all_events`, `event_path` and `event_iso_date` template helpers. It also derives a
machine-readable date from the free-text Spanish `date` string (`iso_date_for`, all 30 parse),
composes a ~155-character meta description per event (`description_for`), and passes each event
its newer/older neighbours so the archive is chained together with prev/next links. Slugs are derived from the
presenter's name via `Bridgetown::Utils.slugify(..., mode: "latin")` (the `latin` mode is what
transliterates the accents); an entry may set `slug:` to pin a URL against a later name change.
The builder also drops any image path missing from `src/`, so a bad path degrades to a shorter
gallery instead of a broken `<img>`. Files under `plugins/builders/` **must** be namespaced
`module Builders` — Zeitwerk raises otherwise.

**Two other builders.** `plugins/builders/images.rb` reads image dimensions out of the file
headers at build time (a small JPEG SOF scanner, plus PNG and SVG) and exposes
`image_dimensions` / `webp_for`, so every `<img>` gets `width`/`height` without anyone
maintaining them by hand. `plugins/builders/seo.rb` emits `/sitemap.xml` from the pages
collection on the `:pre_render` hook — deliberately hand-rolled rather than using
`bridgetown-sitemap`, which annotates every URL with `hreflang` alternates that a
single-locale Spanish site has no use for.

**Layouts and partials.** `src/_layouts/default.erb` is the shell (head partial, navbar,
`yield`, footer); `page.erb` wraps it with a prose container, rendering `data.tagline` as a
styled eyebrow `<p>` and `data.title` as the page's single `<h1>`. `src/_partials/_head.erb` builds `<title>`, canonical, Open Graph, and Twitter
card tags from page front matter with fallback to `src/_data/site_metadata.yml` — so a new page
should set `title`, `tagline`, `description`, and `image` in its front matter. Titles follow
`<title> | f/64 Colima`; set `seo_title` to opt out of that pattern. Other recognised keys:
`image_alt`, `og_type`, `preload_image`, and `sitemap: false` to keep a page out of the sitemap.

`src/_partials/_schema.erb` emits JSON-LD on every page (Organization + WebSite everywhere,
Event + BreadcrumbList on event pages, CollectionPage on `/eventos/`). Build the graph as Ruby
hashes and render with `<%== JSON.pretty_generate(...) %>` — `<%= %>` would escape the quotes and
break the JSON.

`src/_partials/_picture.erb` is how images should be rendered: it emits a `<picture>` with a
WebP `<source>` when a sibling `.webp` exists, plus intrinsic `width`/`height` and either
`fetchpriority="high"` (pass `eager: true` for the first image on a page) or `loading="lazy"`.
Pass all five locals — `src`, `alt`, `classes`, `eager` — as Bridgetown partials raise on
undefined ones.

**Frontend** is in `frontend/`, bundled by esbuild via `config/esbuild.defaults.js` (do not
edit — Bridgetown owns it and `bridgetown esbuild update` overwrites it; customize
`esbuild.config.js` instead). The project is **ESM** (`"type": "module"`), and Bridgetown 2
requires **alias-prefixed imports** in `frontend/javascript/index.js` — `$styles/`, `$javascript/`,
`$components/` (declared in `jsconfig.json`). A bare `import "index.css"` will not resolve.
Stimulus controllers are registered **manually** in `frontend/javascript/controllers/index.js` —
a new controller file is not picked up until it's imported and `application.register`ed there.

**Theming is CSS-first (Tailwind 4) — there is no `tailwind.config.js`.**
`frontend/styles/config.css` holds an `@theme` block; each `--color-skin-*` token there generates
the matching `text-skin-*` / `bg-skin-*` / `border-skin-*` utilities, and opacity modifiers like
`text-skin-inverted/75` work natively. `--font-oswald` generates `font-oswald`. Use those tokens
rather than hard-coded colors. Fonts are self-hosted in `frontend/fonts/`.

Full-bleed decorative backgrounds use the `.bg-photo-*` classes at the bottom of
`frontend/styles/index.css` rather than arbitrary-value background utilities, so they can offer
a WebP through `image-set()` with the JPEG as fallback. Root-relative `/images/...` URLs in that
file pass through esbuild untouched.

Note that `@import "tailwindcss"` carries **`source(none)`**. Tailwind 4 otherwise auto-detects
sources from the repo root, which means prose in a Markdown file at the top level gets scanned
for class names — writing an arbitrary-value utility inside backticks in this very file was
enough to generate a rule whose `url()` esbuild then failed to resolve, breaking the frontend
build. With `source(none)`, only the explicit `@source` lines below it count.

**Gotcha in `frontend/styles/index.css`:** keep every `@import` grouped at the top. Bridgetown
runs `postcss-import` *before* Tailwind, and it silently drops an `@import` that appears after any
other at-rule — putting `@import "./config.css"` below `@plugin`/`@source` makes the whole theme
vanish from the build with no error. Tailwind's class scanner is pointed at the templates by the
explicit `@source` directives in that file.

## Deploy

The site is hosted on **Cloudflare Workers static assets** (the same setup as
`mariochavez/foto`), not GitHub Pages. Cloudflare builds it directly from the repository on
push — there is no GitHub Actions workflow; `.github/` was removed along with the GitHub Pages
pipeline. `wrangler.jsonc` is the whole Cloudflare config: worker name `f64`,
`assets.directory: ./output`, and `not_found_handling: "404-page"` so a missing path renders the
site's own `/404.html`. The custom domain `f64.io` is attached to the worker in the Cloudflare
dashboard, so there is no `CNAME` file in the build.

To build and deploy by hand instead:

```sh
bundle exec rake publish   # BRIDGETOWN_ENV=production build → rake verify → npx wrangler deploy
bundle exec rake verify    # just the checks, against whatever is in output/
```

**Cloudflare's build container sets no locale**, which leaves Ruby's default external encoding
at US-ASCII — every accented character in a template then raises
`Encoding::InvalidByteSequenceError` and the build dies on `_head.erb` before rendering a page.
`config/initializers.rb` sets `Encoding.default_external = Encoding::UTF_8` at the top, outside
the `configure` block, so this holds wherever the site is built. Reproduce locally with
`env -u LANG -u LC_ALL -u LC_CTYPE bundle exec bridgetown build`.

Each deploy replaces the entire asset set, so a file deleted from `src/` stops being served.
That was not true of the original `crazy-max/ghaction-github-pages` setup, which kept history
and only ever *added* files — `/no-bienal/` was still served at HTTP 200 long after being
unpublished, alongside ~49 MB of orphaned images and ten stale asset bundles.

`rake verify` guards the artifacts that are easy to lose silently: it aborts if `sitemap.xml`,
`robots.txt` or `_headers` are missing or empty, if the sitemap drops below 30 URLs, if any page
loses its canonical tag, or if sourcemaps leak into production.

**`plugins/builders/cloudflare.rb` emits `/_headers`**, which sets cache policy. Cloudflare
serves every static asset with `public, max-age=0, must-revalidate`, so even content-hashed
bundles pay a revalidation round trip; the rules there give `/_bridgetown/static/*` a year and
`immutable`, images a week, and leave HTML on the revalidating default. It is generated rather
than kept as `src/_headers` because Bridgetown skips underscore-prefixed entries in `src/`, and
force-including one through the `include:` config key copies it **only intermittently** — the
file vanished from roughly two builds in three, taking the cache policy with it. A `_redirects`
file would need the same treatment; the 14 pre-Bridgetown Jekyll URLs (`/YYYY/MM/DD/title.html`)
currently 404 with no redirect.

Assets are served from `/_bridgetown/static/` as built. The old workflow moved that directory to
`output/assets` and `sed`ed every reference in the built `.html`/`.css`/`.js`, because GitHub
Pages served through Jekyll and Jekyll ignores underscore-prefixed directories. Cloudflare has no
such rule, so the rewrite — and the footgun where any `_bridgetown/static/` URL emitted outside
those three file types would 404 in production while working locally — is gone.

## Notes

- `src/posts.md` and `src/_layouts/post.liquid` (leftover Liquid from the starter) were removed
  along with the `bridgetown-feed` gem, whose `feed.xml` had never had a single entry.
- `src/about.md` (unmodified Bridgetown boilerplate, in English) was replaced by
  `src/acerca-de.md`. The old `/about/` URL is gone; nothing ever linked to it.
- The 14 events before Feb 2020 were recovered from the pre-Bridgetown Jekyll `_posts/` tree at
  commit `fb0f95d^`; that commit still holds `-ev-*` sets and posters if anything else is needed.
- Roda/SSR is available but not enabled — `config/initializers.rb` has no `init` calls left, and
  `server/` holds an untouched sample route.
- `src/images/benom/benom-5.jpg` is a real photograph from Benom's series that `events.yml`
  skips (the list runs 1, 2, 3, 4, 6). Left on disk deliberately in case the omission was
  accidental. `src/images/events/melba-event.jpg` is a similarly unused alternate cover.
- Images are resized on the way in (covers ≤1200px, gallery photos ≤1600px, backgrounds ≤1920px)
  and each `.jpg` has a `.webp` sibling. Regenerate both when adding photos, or the `<picture>`
  simply falls back to the JPEG.
