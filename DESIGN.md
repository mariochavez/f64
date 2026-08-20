---
name: f/64
description: Archivo de 30 pláticas fotográficas en Colima, 2018–2023
colors:
  tinta-indigo: "#1f1b36"
  gris-lectura: "#374151"
  gris-ficha: "#64748b"
  papel: "#ffffff"
  negro-sala: "#000000"
  azul-archivo: "#0369a1"
  azul-archivo-hover: "#075985"
  azul-regla: "#0ea5e9"
  azul-sala: "#075985"
  linea-division: "#e5e7eb"
  velo-claro: "#d1d5db"
  velo-denso: "#4b5563"
typography:
  display:
    fontFamily: "Oswald, ui-sans-serif, system-ui, sans-serif"
    fontSize: "clamp(2.25rem, 5vw, 3.75rem)"
    fontWeight: 700
    lineHeight: 1
    letterSpacing: "-0.025em"
  headline:
    fontFamily: "Oswald, ui-sans-serif, system-ui, sans-serif"
    fontSize: "clamp(1.5rem, 3vw, 2.25rem)"
    fontWeight: 700
    lineHeight: 1.1
    letterSpacing: "-0.025em"
  title:
    fontFamily: "Oswald, ui-sans-serif, system-ui, sans-serif"
    fontSize: "1.25rem"
    fontWeight: 700
    lineHeight: 1.4
    letterSpacing: "-0.025em"
  body:
    fontFamily: "Source Sans Pro, ui-sans-serif, system-ui, sans-serif"
    fontSize: "1rem"
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: "normal"
  lead:
    fontFamily: "Source Sans Pro, ui-sans-serif, system-ui, sans-serif"
    fontSize: "1.25rem"
    fontWeight: 400
    lineHeight: 1.6
    letterSpacing: "normal"
  label:
    fontFamily: "Source Sans Pro, ui-sans-serif, system-ui, sans-serif"
    fontSize: "0.875rem"
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: "normal"
  credit:
    fontFamily: "Source Sans Pro, ui-sans-serif, system-ui, sans-serif"
    fontSize: "0.875rem"
    fontWeight: 700
    lineHeight: 1.4
    letterSpacing: "normal"
rounded:
  obra: "2px"
  ficha: "6px"
spacing:
  gutter: "16px"
  gutter-sm: "24px"
  gutter-lg: "32px"
  section: "64px"
  section-lg: "96px"
  section-xl: "128px"
components:
  button-primary:
    backgroundColor: "{colors.azul-archivo}"
    textColor: "{colors.papel}"
    typography: "{typography.body}"
    rounded: "{rounded.ficha}"
    padding: "8px 24px"
  button-primary-hover:
    backgroundColor: "{colors.azul-archivo-hover}"
    textColor: "{colors.papel}"
  nav-link:
    backgroundColor: "transparent"
    textColor: "{colors.papel}"
    typography: "{typography.label}"
    padding: "0 4px"
    height: "64px"
  nav-link-active:
    backgroundColor: "transparent"
    textColor: "{colors.papel}"
    typography: "{typography.label}"
  card-cover:
    backgroundColor: "{colors.papel}"
    textColor: "{colors.tinta-indigo}"
    typography: "{typography.title}"
    rounded: "{rounded.ficha}"
    padding: "0"
  card-cover-hover:
    textColor: "{colors.azul-archivo}"
  figure-obra:
    backgroundColor: "{colors.papel}"
    textColor: "{colors.tinta-indigo}"
    typography: "{typography.credit}"
    rounded: "{rounded.obra}"
    padding: "0"
  eyebrow:
    backgroundColor: "transparent"
    textColor: "{colors.gris-ficha}"
    typography: "{typography.label}"
---

# Design System: f/64

## Overview

**Creative North Star: "El Archivo Fechado"**

f/64 is a public register of thirty evenings that already happened. The interface is a
catalogue card, not a poster: every session carries a date, a venue, a presenter, and a
credit, and the design's job is to make those four facts unambiguous and permanent. The
structure is visible on purpose — that legibility *is* the aesthetic. Nothing here is
persuading anyone of anything, because there is nothing left to attend.

Around that spine, the system is almost entirely absent. Two families, one accent, white
surfaces, near-square corners, and no ornament that isn't a photograph. Depth is a
photographic property rather than a UI one: full-bleed images run the height of the
viewport, held under a gray multiply scrim so display type can sit on top of them, and
parallax arrives only from `background-attachment: fixed` above `md`. Box-shadows exist but
are vestigial — 1px hairlines under photographs that could disappear tomorrow without the
system noticing.

The tension that keeps it from being bland is scale. Oswald runs to 3.75rem on a page whose
body copy is 1rem, and dates are set at the same size as names — a session's date is a
headline here, not metadata. Photographs are laid out asymmetrically (the first image in
every set spans two of three columns), so a gallery reads as a considered sequence rather
than a contact sheet.

**Key Characteristics:**

- Photography is the only decoration; the interface has none of its own.
- Dates are set as headlines, at display scale, because the archive is organized by them.
- Flat surfaces throughout — depth comes from full-bleed imagery and multiply scrims.
- Near-square corners on the work (2px), gently rounded on navigation objects (6px).
- One accent, sky blue, reserved almost entirely for links and interactive state.
- Credit lines are typographically emphasized (700 weight) and never treated as caption filler.

## Colors

A white-paper system with a single blue accent, black reserved for the fixed navigation, and
gray scrims that exist only to make type survivable over photographs.

### Primary

- **Azul Archivo** (#0369a1): The only accent in the system. Links, the primary button,
  breadcrumb trail, external session links, and every hover transition on a presenter's
  name. It never appears as a fill on a large surface. Measures **5.93:1** on `Papel` — the
  previous value (#0284c7, Tailwind `sky-600`) measured 4.10:1 and failed WCAG AA for
  normal text both as ink and as a button fill.
- **Azul Archivo Hover** (#075985): The pressed/hovered state of the accent, on button
  backgrounds and breadcrumb links. 7.56:1.
- **Azul Regla** (#0ea5e9, `--color-skin-rule`): The 2px underline beneath the current page
  in the navigation, the left border on the active mobile item, and the focus ring on the
  black bar. Structural, never used for text. It stays `sky-500` rather than moving to the
  accent because it lives on `Negro Sala`, where it measures 7.58:1 against the accent's
  3.54:1 — the one place the brighter blue is the accessible choice.
- **Azul Sala** (#075985): Background of the active item in the mobile menu only.

### Neutral

- **Tinta Indígo** (#1f1b36): Body text and headings. A near-black carrying a violet cast,
  chosen so running text sits warmer than pure black against white and never reads as the
  same color as the navigation bar behind it. Protect the hue; it is not `#000`.
- **Gris Lectura** (#374151): Secondary prose — session taglines, addresses, subtitles,
  the list descriptions on `/eventos/`.
- **Gris Ficha** (#64748b): The register's metadata voice. Dates, venue labels, eyebrows,
  breadcrumb separators, footer text, and the empty-state line. If a value is a fact *about*
  the session rather than the session itself, it is this color.
- **Papel** (#ffffff): Every content surface, and all type reversed over photography.
- **Negro Sala** (#000000): The fixed navigation bar, and nothing else. Its job is to hold
  the white wordmark legibly over whatever photograph is scrolling beneath it.
- **Línea División** (#e5e7eb): The single hairline rule in the system, above the
  previous/next session pair at the foot of an event page.

### Scrims

- **Velo Claro** (#d1d5db at `mix-blend-multiply`): Over the home hero only. Just enough to
  hold the wordmark and headline without flattening the photograph.
- **Velo Denso** (#4b5563 at `mix-blend-multiply`): Over full-bleed section backgrounds, where
  the image is decorative and type legibility outranks fidelity.

### Named Rules

**The One Accent Rule.** Azul Archivo marks what is interactive and nothing else. It is
never a decorative fill, never a background for a section, never applied to a heading that
isn't a link. If a blue element cannot be clicked, it is wrong.

**The Token Is The Accent Rule.** Reach for `text-skin-accented` / `bg-skin-accented` and
their `-hover` counterparts, never a raw `sky-*` utility. The theme and the templates once
disagreed about what the accent even was — the token said emerald, twenty call sites said
`sky-600` — and that drift is exactly how a below-AA color survived for years unnoticed.
One definition, in `frontend/styles/config.css`.

**The Scrim-Only Rule.** Gray is never a surface color. The two grays that touch large areas
exist exclusively as `mix-blend-multiply` overlays on photographs, and only where type must
sit on top. A photograph carrying no text carries no scrim.

**The Ink Is Not Black Rule.** Body copy is Tinta Indígo (#1f1b36), never `#000`. Pure black
in this system means the navigation bar. Using it for text collapses the distinction.

## Typography

**Display Font:** Oswald (with `ui-sans-serif, system-ui, sans-serif`)
**Body Font:** Source Sans Pro (with `ui-sans-serif, system-ui, sans-serif`)

**Character:** A condensed grotesque against a humanist sans — the pairing of a wall label
and the page beneath it. Oswald's narrow figures let a long Spanish date ("7 de diciembre de
2023") run at headline scale without wrapping, which is the whole reason the archive can put
dates first. Source Sans Pro handles everything explanatory and gets out of the way.
Both are self-hosted with `font-display: swap`. The root element carries
`font-feature-settings: 'ss01'`.

### Hierarchy

- **Display** (Oswald 700, 2.25rem → 3rem → 3.75rem, line-height 1, tracking -0.025em):
  Page titles, the presenter's name on an event page, and section headings on the home page.
  Steps up at `sm` and `lg`.
- **Headline** (Oswald 700, 1.5rem → 2.25rem, tracking -0.025em): Gallery section headings
  ("El trabajo de…", "La sesión"), and the session date in the event header.
- **Title** (Oswald 700, 1.25rem): Presenter names in a card grid and in the previous/next
  pair.
- **Lead** (Source Sans Pro 400, 1.25rem): Session taglines and the standfirst line under a
  page title. Set against `Gris Lectura`.
- **Body** (Source Sans Pro 400, 1rem, line-height 1.5): Running prose. Long-form pages run
  inside `prose md:prose-lg lg:prose-xl` with a `max-w-prose` measure.
- **Label** (Source Sans Pro 400, 0.875rem, uppercase): Eyebrows ("Sesión de f/64", "Último
  evento", "Sesión anterior"), dates in card grids, and breadcrumbs. Always `Gris Ficha`.
- **Credit** (Source Sans Pro 700, 0.875rem, `Tinta Indígo`): The `© <author>` line under
  every photograph. Bold and full-strength ink — this is the one small-text role that is not
  dimmed.

### Named Rules

**The Date Is A Headline Rule.** In an archive organized by date, the date is not metadata.
On the home page and every event page it is set in Oswald at headline scale or larger, and
it is wrapped in a `<time datetime>` carrying the machine-readable ISO value derived by the
builder.

**The Credit Is Not Caption Rule.** A photograph's `©` line is set at 700 weight in full-
strength ink, never in `Gris Ficha`, never italicized, never smaller than 0.875rem. It is
content, not chrome, and it may not be moved out of the image's immediate vicinity.

**The Uppercase Is For Labels Rule.** Uppercase is reserved for the 0.875rem–1.25rem label
role. Headings are never uppercased; Oswald is already condensed enough that uppercase
display type turns into a wall.

### Known gap

Only Oswald 600 is currently self-hosted (`frontend/fonts/oswald-v49-latin-600.woff2`),
while every heading requests `font-bold` (700), so browsers snap or synthesize. **700 is the
normative display weight** — the correct fix is shipping `oswald-v49-latin-700`, not
downgrading the templates to `font-semibold`.

## Layout

A single centered column at `max-w-7xl` (80rem), with `px-4 → sm:px-6 → lg:px-8` gutters and
`py-16 → sm:py-24 → lg:py-32` vertical rhythm. Prose pages narrow further to `max-w-prose`
for measure. The navigation is fixed at `h-16` across the top with `z-20`, and `<main>`
carries `pt-6`.

Content grids move `1 → 2 → 3` columns: the full archive at `/eventos/` is
`sm:grid-cols-2 lg:grid-cols-3`; the home page's recent-sessions block stops at two; photo
galleries are `sm:grid-cols-3`.

Full-bleed photographic sections are viewport-scaled rather than content-scaled: `h-[95vh]`
for the home hero, `h-screen` for the interstitial bands, `h-[60vh]` for the closing panel.
They alternate with normal-flow content sections, so scrolling the home page is a rhythm of
photograph and register.

Two-column headers use `sm:text-right` on the second column, setting name against date and
tagline against venue at opposite edges of the measure.

### Named Rules

**The Hero Photo Is Asymmetric Rule.** In any gallery of three or more **authored work**,
the first figure spans two of three columns (`sm:col-span-2`) and the rest are single. A
photo set is a sequence with an opening image, never a uniform grid. The rule stops at
authored work on purpose: session and audience photographs are context, carry a different
copyright, and run in a deliberately tighter grid (`grid-cols-2 sm:grid-cols-4`) so the
distinction survives after the heading has scrolled away.

**The Parallax Stops At `md` Rule.** `bg-fixed` is applied only above `md`
(`bg-scroll md:bg-fixed`). Fixed backgrounds repaint on every scroll frame and are a known
source of mobile jank.

**The Motion Is Optional Rule.** Every transform is written `motion-safe:`, and
`scroll-smooth` is paired with `motion-reduce:scroll-auto`. When motion is suppressed the
color change carries the same signal the movement did, so no state becomes unreadable.

**The Focus Matches Hover Rule.** Any `group-hover:` treatment ships a
`group-focus-visible:` counterpart, and every card-sized link carries a 2px
`outline-skin-accented` at 4px offset. A keyboard user never gets less affordance than a
mouse user. On touch there is no hover at all, so an affordance that exists only on hover
does not exist for the primary audience: links carry the accent color at rest.

**The Register States Its Own Closure Rule.** Every event page says which session it is
(`Sesión N de 30`), which year it belongs to (a breadcrumb step linking to that year's
anchor in the archive), and that the cycle ended. Visitors land deep, so a fact that lives
only on the index is a fact most of them never see.

## Elevation & Depth

**Depth in this system is photographic, not architectural.** There is no elevation ladder,
no surface tiers, and no shadow that communicates hierarchy. Surfaces are flat white and
stay flat. What creates space is imagery: photographs running the full width and height of
the viewport, parallaxed above `md`, held under a multiply scrim, alternating with flat
content bands. The perception of layers comes from the black navigation bar floating over
that imagery at `z-20`, and from nothing else.

The box-shadows still present are vestigial and should be read as near-zero rather than as a
vocabulary to extend.

### Shadow Vocabulary

- **Hairline** (`box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05)` — `shadow-xs`): Under gallery
  photographs and figures. Barely perceptible; it separates a light image from white paper.
- **Ficha** (`box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1)`
  — `shadow-md`): Cover images in the archive grid, the one place a card reads as an object.
- **Nav** (`box-shadow: 0 1px 2px 0 rgb(0 0 0 / 0.05)` — `shadow-sm`): The fixed navigation.

### Named Rules

**The Photograph Is The Elevation Rule.** When a section needs depth, it gets a photograph —
full-bleed, scrimmed, and parallaxed above `md`. It does not get a shadow, a gradient, or a
tinted panel. There are no new shadow tokens to invent here.

## Shapes

Rectangles, with two radii and a deliberate distinction between them.

**Photographs are nearly square-cornered** (`rounded-xs`, 2px). The work is presented as a
print laid on paper, not as a rounded UI tile. **Navigation objects are gently rounded**
(`rounded-md`, 6px) — cover cards in the archive grid, the primary button, the mobile menu
button. The radius signals interactivity: a 6px corner is something you act on, a 2px corner
is something you look at.

Borders are almost absent. The system has exactly one horizontal rule (above the
previous/next pair), a 2px bottom border marking the active desktop nav item, and a 4px left
border on the active mobile item. There are no card borders, no input strokes, no dividers
between grid items.

### Named Rules

**The Two Radii Rule.** 2px for the work, 6px for the interface. Nothing in this system is
`rounded-full`, `rounded-xl`, or larger — a pill or a heavily rounded panel reads as product
UI and breaks the register.

## Components

The component set is deliberately small and reads *sobrio y verificable*: each one looks like
an archive record — near-straight edges, no ornament, and the fact (date, venue, credit)
always visible and never decorative.

### Buttons

There is exactly one button in the system: the archive's call to the full listing.

- **Shape:** Gently rounded (`rounded-md`, 6px), no border.
- **Primary:** `Azul Archivo` (#0369a1) fill, white label, `padding: 8px 24px`, Source Sans
  Pro 500, 1rem, with a hairline shadow.
- **Hover:** Fill deepens to `Azul Archivo Hover` (#075985). No lift, no scale.
- **Focus:** 2px `Azul Archivo` ring at 2px offset (`focus:ring-2 focus:ring-skin-accented
  focus:ring-offset-2`), with the default outline suppressed. The ring was `sky-500`, which
  measures 2.77:1 on `Papel` and misses the 3:1 floor WCAG 1.4.11 sets for focus indicators.
- **Secondary / ghost:** None exist. Every other action in the system is a text link in
  `Azul Archivo`.

### Cards / Containers

The cover card is the archive's primary unit — one per session, thirty on `/eventos/`.

- **Corner Style:** `rounded-md` (6px) on the image wrapper, which carries `overflow-hidden`.
- **Background:** `Papel`. The card has no panel; it is an image with text beneath it.
- **Shadow Strategy:** `Ficha` (`shadow-md`) on the image only — see Elevation & Depth.
- **Border:** None.
- **Internal Padding:** None. The card is edge-to-edge image, with `mt-4` to the presenter's
  name, `mt-1` to the date, `mt-2` to the tagline.
- **Hover:** The image scales to 1.05 over 300ms inside the fixed frame, and the presenter's
  name shifts to `Azul Archivo`. The whole card is one `<a>` — image, name, date, and tagline
  are all inside the link.
- **Text stack:** Title (Oswald 700, 1.25rem) → Label uppercase date in `Gris Ficha` →
  tagline in `Gris Lectura`, clamped to three lines (`line-clamp-3`).

### Figure (the signature component)

Every photograph on the site is a `<figure>` with an attached credit, rendered through the
`_picture.erb` partial.

- **Image:** A `<picture>` with a WebP `<source>` when a sibling `.webp` exists, intrinsic
  `width`/`height` read from the file header at build time, and either `fetchpriority="high"`
  (first image on a page) or `loading="lazy"`.
- **Shape:** `rounded-xs` (2px) with the `Hairline` shadow.
- **Caption:** `mt-3`, Source Sans Pro 700, 0.875rem, full-strength `Tinta Indígo`, in the
  form `© <author>`. Presenter work carries the presenter's name; session photographs carry
  `© f/64`.
- **Layout:** First figure in a set spans two of three columns; the rest are single.

### Navigation

- **Bar:** Fixed, full-bleed, `Negro Sala` (#000000), `h-16`, `z-20`, hairline shadow.
- **Wordmark:** `f64-white.svg` at `h-8`, left-aligned on desktop, centered on mobile,
  wrapped in a link labelled `f/64 — inicio`.
- **Links:** Source Sans Pro 700, 0.875rem, white at 75% opacity, rising to full white on
  hover with a `gray-300` bottom border.
- **Active:** Full-strength white with a 2px `Azul Regla` bottom border, plus
  `aria-current="page"`.
- **Mobile:** A hamburger toggle below `sm` driven by the `mobile-menu` Stimulus controller,
  revealing a stacked list where each item carries a 4px left border; the active item is
  `Azul Sala` (#075985) filled with an `Azul Regla` border.
- **Skip link:** A visually hidden "Saltar al contenido" that becomes a white, rounded,
  absolutely-positioned chip at `z-50` on focus.

### Breadcrumbs

Inline `<ol>` at 0.875rem in `Gris Ficha`, separated by `/` marked `aria-hidden`. The
`/eventos/` link is bold uppercase in `Azul Archivo`; the current page is plain text with
`aria-current="page"`.

### Previous / Next

A two-column band above the page foot, separated by the system's one horizontal rule. Each
side is an uppercase `Gris Ficha` label ("Sesión anterior" / "Sesión siguiente"), the
presenter's name in Oswald 700 at 1.25rem, and the date. The next-session column is
right-aligned at `sm`. Either side may be absent at the ends of the archive.

### Footer

White, `max-w-7xl`, everything centered below `md` and split left/right above it. All text is
`Gris Ficha` at 1rem, hovering to `Gris Lectura`. Social icons are inline 24px SVGs with
`sr-only` labels. It always carries the copyright line asserting that images belong to their
authors.

## Do's and Don'ts

### Do:

- **Do** render every image through `_partials/_picture.erb` (or `_cover.erb`, which guards
  a missing file), passing all five locals — `src`, `alt`, `classes`, `eager`, `sizes`.
  Bridgetown raises on undefined ones, and the partial is what supplies WebP, intrinsic
  dimensions, the loading strategy, and the `srcset` of narrow variants.
- **Do** give `sizes` the slot's real rendered width, per call site — it is the only thing
  the partial cannot infer, and a wrong `sizes` is worse than none.
- **Do** attach a `©` credit to every photograph, at 700 weight in full-strength ink,
  immediately below the image.
- **Do** wrap dates in `<time datetime="…">` using the ISO value the events builder derives,
  and set them in Oswald at headline scale or larger.
- **Do** reach for the `skin-*` token utilities (`text-skin-base`, `text-skin-muted`,
  `text-skin-dimmed`, `text-skin-inverted`) for text color.
- **Do** give the first figure in any three-or-more gallery `sm:col-span-2`.
- **Do** pair `bg-scroll md:bg-fixed` on any full-bleed background, and mark the section
  `aria-hidden="true"` when the photograph is decorative.
- **Do** keep the accent to interactive elements only.

### Don't:

- **Don't** hard-code a `sky-*` utility for accent text or fills. `--color-skin-accented`
  and `--color-skin-accented-hover` in `frontend/styles/config.css` are now the live,
  AA-compliant accent (#0369a1 / #075985); they previously held an unused emerald while the
  templates used a `sky-600` that failed contrast. See **The Token Is The Accent Rule**.
- **Don't** introduce a second accent hue, a gradient, or a tinted section background. White
  paper, black bar, one blue.
- **Don't** add elevation. If a region needs depth, it gets a scrimmed photograph — see
  **The Photograph Is The Elevation Rule**.
- **Don't** round anything past 6px, and never use `rounded-full` or `rounded-xl`.
- **Don't** set body text in `#000`; it is `Tinta Indígo` (#1f1b36).
- **Don't** dim, shrink, italicize, crop, or relocate a credit line away from its photograph.
- **Don't** uppercase a heading. Uppercase belongs to the label role.
- **Don't** ship an `<img>` without `width`/`height` — the partial supplies them, and going
  around it reintroduces the layout shift that motivated `plugins/builders/images.rb`.
- **Don't** state a fact only on the index. `/eventos/` is not the page most visitors see;
  see **The Register States Its Own Closure Rule**.
- **Don't** write arbitrary-value background utilities for full-bleed imagery; add a
  `.bg-photo-*` class at the foot of `frontend/styles/index.css` so the WebP can be offered
  through `image-set()`.
