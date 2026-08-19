---
layout: page
title: Sesiones de f/64
seo_title: Sesiones de f/64 — archivo 2018–2023 | f/64 Colima
tagline: Eventos anteriores
description: Las 30 pláticas fotográficas de f/64 en Colima, de noviembre de 2018 a diciembre de 2023. El archivo completo, sesión por sesión.
image: /images/f64-publico.jpg
image_alt: Público asistente a una plática fotográfica de f/64 en Colima
---

<div class="prose md:prose-lg lg:prose-xl">
  <p>
  De noviembre de 2018 a diciembre de 2023, cada primer jueves del mes una fotógrafa o un fotógrafo presentó su trabajo ante el público en Colima. Fueron <%= all_events.size %> sesiones y aquí están todas.
  </p>

  <p>
  <strong>El ciclo concluyó y no habrá nuevas sesiones.</strong> Este archivo reúne todas las pláticas que se presentaron.
  </p>
</div>

<div class="mt-12 grid grid-cols-1 gap-x-8 gap-y-12 sm:grid-cols-2 lg:grid-cols-3">
  <% all_events.each_with_index do |event, index| %>
    <a href="<%= event_path(event) %>" class="group block">
      <div class="overflow-hidden rounded-md shadow-md">
        <%# The first row is above the fold on every viewport, so it loads eagerly
            rather than waiting for the lazy-loading pass. %>
        <%= render "picture",
              src: event.cover,
              alt: "#{event.presenter}, sesión de f/64 en Colima, #{event.date}",
              classes: "w-full transition duration-300 group-hover:scale-105",
              eager: index < 3 %>
      </div>
      <h2 class="mt-4 font-oswald text-xl font-bold tracking-tight group-hover:text-sky-600">
        <%= event.presenter %>
      </h2>
      <p class="mt-1 text-sm uppercase text-skin-dimmed">
        <% if (iso = event_iso_date(event)) %>
          <time datetime="<%= iso %>"><%= event.date %></time>
        <% else %>
          <%= event.date %>
        <% end %>
      </p>
      <p class="mt-2 line-clamp-3 text-skin-muted"><%= event.tagline %></p>
    </a>
  <% end %>
</div>
