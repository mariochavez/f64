# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

Three confirmed audiences, all Spanish-speaking, all arriving after the fact:

- **Público de Colima** — people from the local scene (former attendees, photography
  students, curious locals) who remember f/64 or are discovering that it existed, and want
  to see what happened there. Mostly mobile, mostly arriving from a shared link or a
  search for a presenter's name.
- **Los presentadores** — the 30 photographers who gave a talk. For them their event page
  is a public, citable record of the session and of the work they showed. They may link to
  it from their own bios and portfolios, so a page must stand alone as a credible credit.
- **Investigación y memoria** — press, researchers, and institutions documenting
  photographic production in Colima, who need a dated, verifiable register: who presented,
  when, where, and what they showed.

No audience is being recruited or converted. Nobody arrives to sign up; everyone arrives
to look something up or to look back.

## Product Purpose

f/64 was a cycle of free photography talks in Colima, Mexico. Every first Thursday of the
month a photographer presented their work to the public and then talked with the audience
about how and why they made it. The first session was 8 November 2018, the last 7 December
2023 — 30 sessions in all.

**The cycle is over and permanently closed.** The site's only remaining job is to preserve
those 30 sessions and keep them legible: the presenters, their dates and venues, the work
each one showed, and the audience photographs from the night. It will not grow again and
carries no announcement of a return.

Success is that a session is still findable, readable, and correctly credited years from
now — and that a presenter is happy to link to their page.

## Positioning

There is no competing product; the differentiator is the material itself. f/64 is the only
record of these 30 evenings, and the photographs on it are the presenters' own work,
published with their permission and under their copyright. Nobody else can truthfully
reproduce this content.

## Operating Context

- Sessions ran monthly at rotating venues across Colima and Comala — michelada.io on
  avenida Carranza, Casa Volcán in Comala, and spaces in the Santa Bárbara, Centro, and
  Jardines Residenciales neighbourhoods. Each session's address is recorded on its page.
- The format had no curation and no open call: the invited photographer chose the subject
  and the way to show it — a finished project, work in progress, an inherited archive, a
  personal obsession. The conversation after the talk was often the best part of the night.
- Visitors typically arrive by a shared link or a name search, land deep on a single event
  page, and either stop there or move sideways through the archive.

## Capabilities and Constraints

- Static site, no server, no accounts, no search, no forms. Contact is an email address and
  the Facebook and Instagram accounts.
- `src/_data/events.yml` is the database: 30 entries in load-bearing reverse-chronological
  order, each with `presenter`, a free-text Spanish `date`, `address`, `tagline`,
  `copyright`, `cover`, `photos` (the presenter's work) and usually `event_photos`
  (audience/session shots, © f/64).
- Content is fixed and finite. There is no CMS and no future author; any new page is hand-
  written into the repository.
- Locale is Spanish (`lang: es`), timezone Guadalajara. Site title `f/64`, domain `f64.io`.
- Terminology to keep: *pláticas* (not "charlas" or "conferencias"), *sesiones*,
  *presentador/presentadora* or *invitada/invitado*, *público*.

## Brand Commitments

- **Credit and authorship are inviolable.** Every photograph carries the © of the person
  who made it and is published with their authorization. A visible credit may never be
  cropped, moved out of view, dimmed into decoration, or dropped from a layout.
- **Everything in Spanish.** Mexican Spanish throughout, with no English version and no
  mixed-language copy or labels.
- **Free and open.** f/64 was always gratuito y abierto al público, with no curation and no
  open call. Nothing on the site may imply a fee, a selection process, or exclusivity.
- Existing marks: the `f/64` wordmark (`src/images/f64.svg`, `f64-white.svg`), Oswald for
  display type, and a photographic-first presentation where the work outranks the interface.
- Voice: plain, warm, first-person plural, unpromotional. It states what happened rather
  than selling it.

## Evidence on Hand

- 30 event entries in `src/_data/events.yml`, each with a real date, presenter, venue, and
  tagline.
- Photographic sets under `src/images/<slug>/` (presenter's work) plus covers at
  `src/images/events/<slug>.jpg`, and audience photographs from most sessions.
- Site-level photography: `src/images/home.jpg`, `talks.jpg`, `f64-publico.jpg`, and the
  full-bleed backgrounds.
- **Absent, and never to be invented:** testimonials, attendance figures, sponsors, press
  coverage, awards, institutional endorsements, or any quantified claim about impact.
  Anylú Villalvazo y David Ayala (Dec 2022) has no photo set at all — only a cover — and
  that gap must not be filled with substitute imagery.
- `/no-bienal/` (`src/no-bienal.md`, `published: false`) is an unpublished 2023 open call,
  deliberately withdrawn. It is not part of the archive.

## Product Principles

1. **The photographs lead.** The interface exists to present other people's work; when a
   design decision competes with an image, the image wins.
2. **Credit travels with the image.** Attribution is content, not chrome — it survives
   every layout, breakpoint, and crop.
3. **A closed archive, stated plainly.** The site says the cycle ended without mourning it
   and without hinting at a return.
4. **Every session is a destination.** People land deep, not on the home page; each event
   page must be complete, credible, and linkable on its own.
5. **Built to outlast its authors.** Static, dependency-light, and durable — the archive
   should still serve correctly with nobody maintaining it.

## Accessibility & Inclusion

No formal standard was established as a product requirement. Practical needs that follow
from the audience: the site is read mostly on phones over ordinary mobile connections, so
image weight and legibility over photographic backgrounds are real constraints, and
decorative imagery must stay out of the accessibility tree so screen-reader users reach the
credited work directly.
