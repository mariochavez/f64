# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

`f64.io` — the static site for **f/64**, a monthly photography talk series in Colima, Mexico.
Built with **Bridgetown 2**, ERB templates, **Tailwind CSS 4**, esbuild, and Hotwire
(Turbo + Stimulus), on **Ruby 4.0** and **Yarn 4**. All user-facing copy is **Spanish**
(`lang: es`, timezone `Guadalajara`).

There is no test suite and no application server in production — the site builds to static
HTML in `output/` and is published to GitHub Pages.

## Commands

```sh
bundle install && yarn install   # setup (Yarn 4 via corepack; package.json pins the version)

bin/bridgetown start             # dev server + esbuild watch → http://localhost:4000
bin/bridgetown console           # IRB with the site loaded
bin/bridgetown deploy            # clean + frontend build + site build (same as `rake`)

bundle exec rake test            # build with BRIDGETOWN_ENV=test (a build, not a test suite)
```

Ruby 4.0.0, pinned in `.ruby-version` and mirrored by `RUBY_VERSION` in the CI workflow.
There is no lint task wired into the bundle — `.rubocop.yml` and `.standard.yml` are
**symlinks into `~/Development/neovim-files/`**, so editing them changes every project that
links them.

## Architecture

**Content lives in `src/`.** Bridgetown's `template_engine` is `erb`, so `.md` pages under
`src/` are ERB-first: front matter, then a body that freely mixes Markdown and ERB with full
Tailwind markup inline (see `src/index.md`). The older `src/posts.md` and
`src/_layouts/post.liquid` are leftover Liquid from the Bridgetown starter — don't follow them
as a pattern for new work.

**`src/_data/events.yml` is the site's database** — 30 talks, Nov 2018 to Dec 2023. Every entry
has `presenter`, `date` (a free-text Spanish string, not a parsed date), `address`, `tagline`,
`copyright`, `cover`, a `photos` array (the photographer's work, © presenter) and, for most,
`event_photos` (audience/session shots, © f/64). Order is **reverse-chronological and
load-bearing**: `src/index.md` reads `site.data.events.first` as the *next* event and
`slice(1..8)` as past events, while everything after index 0 is the `/eventos/` archive.
Adding a new event means prepending to this file and dropping images under `src/images/<slug>/`
plus a cover at `src/images/events/<slug>.jpg`.

**`plugins/builders/events.rb` turns each past event into a page** at `/eventos/<slug>/`, and
supplies the `past_events` and `event_path` template helpers. Slugs are derived from the
presenter's name via `Bridgetown::Utils.slugify(..., mode: "latin")` (the `latin` mode is what
transliterates the accents); an entry may set `slug:` to pin a URL against a later name change.
The builder also drops any image path missing from `src/`, so a bad path degrades to a shorter
gallery instead of a broken `<img>`. Files under `plugins/builders/` **must** be namespaced
`module Builders` — Zeitwerk raises otherwise.

**Layouts and partials.** `src/_layouts/default.erb` is the shell (head partial, navbar,
`yield`, footer); `page.erb` wraps it with a prose container and renders `data.tagline` /
`data.title` as the heading. `src/_partials/_head.erb` builds `<title>`, Open Graph, and Twitter
card tags from page front matter with fallback to `src/_data/site_metadata.yml` — so a new page
should set `title`, `tagline`, `description`, and `image` in its front matter.

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

**Gotcha in `frontend/styles/index.css`:** keep every `@import` grouped at the top. Bridgetown
runs `postcss-import` *before* Tailwind, and it silently drops an `@import` that appears after any
other at-rule — putting `@import "./config.css"` below `@plugin`/`@source` makes the whole theme
vanish from the build with no error. Tailwind's class scanner is pointed at the templates by the
explicit `@source` directives in that file.

## Deploy

Push to `main` triggers `.github/workflows/ci.yml`, which builds with
`BRIDGETOWN_ENV=production` and pushes `output/` to the `gh-pages` branch (FQDN `f64.io`).

The workflow includes a **post-build asset-path rewrite**: it moves
`output/_bridgetown/static` → `output/assets` and `sed`s every `_bridgetown/static/` reference
in the built `.html`/`.css`/`.js`. GitHub Pages serves via Jekyll, which ignores
underscore-prefixed directories. Anything that emits a `_bridgetown/static/` URL outside those
three file types will 404 in production while working fine locally — prefer `asset_path :css` /
`asset_path :js` helpers and keep new asset references inside HTML/CSS/JS.

## Notes

- `src/about.md` is still unmodified Bridgetown boilerplate in English.
- `src/posts.md` renders raw Liquid tags into the built page: `template_engine` is `erb`, so its
  `{% for %}` block is never evaluated. Pre-existing, and nothing links to `/posts/`.
- `src/index.md` carries two dead classes, `gapx-2` and `text-md`, that have never existed in
  Tailwind (`gap-x-2` / `text-base` are the real names). Left as-is to preserve exact rendering.
- Anylú Villalvazo y David Ayala (Dec 2022) has `photos: []` — that session's photo set was never
  committed to the repo, in any branch or commit. Only the cover exists.
- The 14 events before Feb 2020 were recovered from the pre-Bridgetown Jekyll `_posts/` tree at
  commit `fb0f95d^`; that commit still holds `-ev-*` sets and posters if anything else is needed.
- Roda/SSR is available but not enabled — `config/initializers.rb` only inits `bridgetown-feed`,
  and `server/` holds an untouched sample route.
