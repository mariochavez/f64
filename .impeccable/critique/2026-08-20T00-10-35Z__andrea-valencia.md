---
target: /eventos/andrea-valencia/
total_score: 18
max_score: 40
na_heuristics: 
p0_count: 1
p1_count: 2
timestamp: 2026-08-20T00-10-35Z
slug: andrea-valencia
---
Method: dual-agent (A: a35d45cbbc9bd51e6 · B: a9fe0d4568955e95c)

# Critique: /eventos/andrea-valencia/

**Mode: Read, with unmet Experience obligations in its middle third.** The spine is register; the two galleries are Experience territory rendered in Read voice.

## Design Health Score — 18/40, Poor (45%)

| # | Heuristic | Score | Key Issue |
|---|---|---|---|
| 1 | Visibility of System Status | 2 | Never says where in the archive this is. `event_number` exists, used on the index, called 0 times here. |
| 2 | Match System / Real World | 2 | "8pm en Ave Carranza 1248…" — the grammar of a listing, on an event six years past. |
| 3 | User Control and Freedom | 2 | No link back to #anio-2020; no way to enlarge any of 12 photographs. |
| 4 | Consistency and Standards | 1 | Exactly one link on the page looks like a link. |
| 5 | Error Prevention | 2 | Builder guards are good; JSON-LD undoes them with eventStatus: EventScheduled. |
| 6 | Recognition Rather Than Recall | 2 | ©-provenance split carried only by an h2 that scrolls away. |
| 7 | Flexibility and Efficiency | 1 | No lightbox, no keyboard gallery traversal, no srcset — 853 KB at fixed 1024px. |
| 8 | Aesthetic and Minimalist Design | 3 | Strongest axis; states the same fact three times before the fold. |
| 9 | Error Recovery | 1 | No-photos state is a bare dimmed sentence; doesn't offer the cover that exists on disk. |
| 10 | Help and Documentation | 2 | Tells a cold arrival nothing about what f/64 was or that it ended. |

Foundations are sound (credit discipline, semantics, restraint); nearly every deduction is a small concentrated fix.

## Design Specificity Verdict

Generic, and the page does not apply its own design system. DESIGN.md Named Rules checked:
- The Date Is A Headline — PARTIAL FAIL (name 4xl→6xl, date 2xl→3xl, ~900px apart at lg)
- The Hero Photo Is Asymmetric — FAIL, half-applied ("La sesión" has 7 photos, no col-span-2)
- The Credit Is Not Caption — PASS (the one rule honored completely)
- The Two Radii — PASS, vacuously (no 6px object exists here)
- The Focus Matches Hover — FAIL comprehensively (zero focus-visible in the file, VERIFIED)
- The Motion Is Optional — n/a (no motion exists)
- The Token Is The Accent — PASS in article, FAIL in shell (navbar: raw border-sky-500, bg-sky-800, focus:ring-indigo-500)
- The Uppercase Is For Labels — FAIL (eyebrow at text-xl vs documented 0.875rem label role)

PATTERN: src/eventos.md (recently overhauled) is largely compliant; event.erb is pre-overhaul code. The system's rules were written from the index and never pushed to the page that receives the traffic. Process finding, not taste finding.

**Deterministic scan:** event.erb clean (exit 0). Built HTML: 3 findings, all `side-tab` border-l-4 at 270/273/276 — all the mobile nav active-state indicator, ALL FALSE POSITIVES. Scan DEGRADED again (no htmlparser2/css-select/css-tree/domutils) — undercount by the tool's own warning.

**Contrast now passes everywhere** — all 7 pairs measured: accent 5.93:1, dimmed 4.76:1, body 16.56:1. The polish pass holds here too.

**Visual overlays unavailable** — no browser tooling. Touch-target heights are estimated from Tailwind classes, NOT measured.

## What's Working

1. Credit discipline is exemplary — 12 figures, © in full ink under each, honest provenance split, mirrored in JSON-LD creator/copyrightHolder/creditText.
2. The builder cannot assert what it doesn't know — present_in_source, iso_date_for nil-on-fail, weekday_note_for derived.
3. Restraint as an aesthetic, not an absence.

## Priority Issues

### [P0] Nothing says this already happened — and the markup says the opposite
Header reads "8pm en Ave Carranza 1248…"; h1 subtitle is timeless; _schema.erb:75 emits eventStatus EventScheduled with startDate 2020-02-06T20:00:00-06:00 (VERIFIED). Closure statement lives only on /eventos/.
Fix: reframe metadata column as register; add "Sesión N de 30" via the existing event_number helper; fix eventStatus for past events.

### [P1] Every interactive element is invisible until hovered — and mobile has no hover
"Inicio" in text-skin-dimmed; prev/next names in text-skin-base, hover-only. ZERO focus:/focus-visible: in event.erb (VERIFIED: 0 matches). Targets ~20–28px. The index ships focus-visible:outline-2 outline-offset-4 outline-skin-accented and min-h-11.
Fix: accent color on Inicio and prev/next; wrap each prev/next block in one <a>; add the index's focus ring and min-h-11.

### [P1] The page never shows the cover, so it opens with no photograph
ev.cover feeds og:image/twitter:image and is NEVER rendered in <body> (VERIFIED). First ~700px is type.
Fix: render the cover via _cover.erb at the top — a full-bleed scrimmed band carrying name and date would also fix the Date Is A Headline demotion. Move eager: true to it.

### [P2] The two galleries are indistinguishable, and "La sesión" breaks the asymmetric rule
Identical grid/radius/shadow/caption. 7 session photos share BYTE-IDENTICAL alt text.
Fix: differentiate structurally; apply the asymmetric rule or document why it stops at authored work; de-duplicate alts.

### [P2] 853 KB of fixed-1024px imagery with no srcset
_picture.erb emits one source, no sizes, no width descriptors. Portrait and landscape are MIXED inside one grid (four 683×1024 + one 1024×683), so the col-span-2 opener is a portrait rendering ~800×1200.
Fix: emit srcset/sizes from the existing resize pass; images.rb already reads dimensions at build time.

### [P3] The presenter has no outbound path, and the affordance is dead code
data.links.any? renders for ZERO of 30 events (VERIFIED — no row has a links: key).
Fix: content, not layout — populate links: where a public account is known and verifiable.

## Persona Red Flags

**Casey (Mobile)** — no photograph in the first viewport on a page reached by tapping a photograph. No hover on phones, so prev/next and Inicio are plain text. ~7000px scroll where tapping a photo does nothing, 12 times.

**Sam (A11y)** — no focus style on any link in the layout; navbar ring is focus:ring-indigo-500. Seven byte-identical alt strings. Work photo alts describe nothing ("Fotografía 1 de…"). h1 contains a nested subtitle span. Prev/next <a> wraps only the name (VERIFIED).

**Andrea Valencia** — her 5 photographs outnumbered 7-to-5 by audience snapshots on her own page, taking 72% of the bytes. No link to her anywhere. Work can't exceed a ~400px cell. Alts render her series as five numbers. Answer: "reluctantly yes."

## Minor Observations

- Prev/next renders an empty <div> at either end of the archive.
- "jobTitle": "Fotógrafo/a" on all 30 pages, unsanctioned by PRODUCT.md terminology.
- Prev/next surfaces data inconsistency: "5 de Marzo 2020" beside "9 de enero 2020"; dates omit "de" before the year.
- Meta description truncates mid-word at 148 chars.
- og:image is a photograph that appears nowhere on the destination.
- <article class="bg-white"> and footer bg-white are hard-coded, not skin-* tokens.

## Questions to Consider

1. We overhauled the index and not the destination — and PRODUCT.md says almost nobody sees the index.
2. If a stranger can't tell from this page that the series ended, is it an archive or an orphaned listing?
3. The page publishes twelve photographs and offers no way to look at any of them.
4. Is a credit that leads nowhere actually a credit?
