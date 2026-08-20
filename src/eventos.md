---
layout: page
title: Sesiones de f/64
seo_title: Sesiones de f/64 — archivo 2018–2023 | f/64 Colima
description: Las 30 pláticas fotográficas de f/64 en Colima, de noviembre de 2018 a diciembre de 2023. El archivo completo, sesión por sesión.
image: /images/f64-publico.jpg
image_alt: Público asistente a una plática fotográfica de f/64 en Colima
---

<div class="prose md:prose-lg lg:prose-xl">
  <p>
  De noviembre de 2018 a diciembre de 2023, casi siempre el primer jueves del mes, una fotógrafa o un fotógrafo presentó su trabajo ante el público en Colima. Fueron <%= all_events.size %> sesiones y aquí están todas.
  </p>

  <p>
  <strong>El ciclo concluyó y no habrá nuevas sesiones.</strong> Este archivo reúne todas las pláticas que se presentaron.
  </p>

  <p>
  Cada portada es una fotografía de quien presentó esa sesión, publicada aquí con su autorización. <strong>El derecho de autor es de cada fotógrafa y fotógrafo</strong>; el crédito completo está en la página de su sesión.
  </p>
</div>

<%# The archive is grouped by year rather than poured into one 30-cell grid.
    Five year headings turn thirty flat items into groups of 1-12, give the page
    landmarks to scan and link against, and let the register state the one thing
    the flat list could not: that it stopped for 33 months and then resumed. %>
<nav aria-label="Ir a un año del archivo" class="mt-12 flex flex-wrap items-baseline gap-x-5 gap-y-2 border-t border-gray-200 pt-6">
  <span class="text-sm uppercase text-skin-dimmed">Ir al año</span>
  <% archive_years.each do |group| %>
    <a href="#anio-<%= group["anchor"] %>"
       class="-mx-2 flex min-h-11 items-center px-2 font-oswald text-lg font-bold tracking-tight text-skin-accented hover:text-skin-accented-hover focus-visible:outline-2 focus-visible:outline-solid focus-visible:outline-offset-2 focus-visible:outline-skin-accented"><%= group["year"] %></a>
  <% end %>
</nav>

<% shown = 0 %>
<% archive_years.each do |group| %>
  <section aria-labelledby="anio-<%= group["anchor"] %>" class="mt-16">
    <h2 id="anio-<%= group["anchor"] %>" class="flex items-baseline gap-x-4 font-oswald text-3xl font-bold tracking-tight sm:text-4xl">
      <%= group["year"] %>
      <span class="text-sm font-normal uppercase tracking-normal text-skin-dimmed">
        <%= group["events"].size %> <%= group["events"].size == 1 ? "sesión" : "sesiones" %>
      </span>
    </h2>

    <ul class="mt-8 grid grid-cols-1 gap-x-8 gap-y-12 sm:grid-cols-2 lg:grid-cols-3">
      <% group["events"].each do |event| %>
        <li>
          <a href="<%= event_path(event) %>"
             class="group block rounded-md focus-visible:outline-2 focus-visible:outline-solid focus-visible:outline-offset-4 focus-visible:outline-skin-accented">
            <div class="overflow-hidden rounded-md shadow-md">
              <%# Only the very first cover is eager: `index < 3` was tuned for the
                  three-column desktop grid and fired two competing high-priority
                  requests on mobile, where a single card is above the fold.
                  `alt` is empty because the link already announces the presenter
                  and the date as text — a describing alt said both twice. %>
              <%= render "cover",
                    src: event.cover,
                    alt: "",
                    classes: "aspect-[1200/628] w-full object-cover transition duration-300 motion-safe:group-hover:scale-105 motion-safe:group-focus-visible:scale-105",
                    eager: shown.zero?,
                    sizes: "(min-width: 1024px) 33vw, (min-width: 640px) 50vw, 100vw" %>
            </div>
            <h3 class="mt-4 font-oswald text-xl font-bold tracking-tight break-words hyphens-auto group-hover:text-skin-accented group-focus-visible:text-skin-accented">
              <%= event.presenter %>
            </h3>
            <p class="mt-1 text-sm uppercase text-skin-dimmed">
              Sesión <%= event_number(event) %> &middot;
              <% if (iso = event_iso_date(event)) %>
                <time datetime="<%= iso %>"><%= event.date %></time>
              <% else %>
                <%= event.date %>
              <% end %>
            </p>
            <p class="mt-2 line-clamp-3 text-skin-muted"><%= event.tagline %></p>
          </a>
        </li>
        <% shown += 1 %>
      <% end %>
    </ul>
  </section>

<%# Column 0 is load-bearing: this file is Markdown, and `</section>` above closes
    the raw-HTML block. A line indented four spaces after a blank line is an
    indented code block, which is exactly how this note first shipped — rendered
    as escaped source instead of a paragraph. %>
<% if group["hiatus"] %>
<p class="mt-16 border-t border-gray-200 pt-8 text-sm uppercase text-skin-dimmed"><%= group["hiatus"] %></p>
<% end %>
<% end %>
