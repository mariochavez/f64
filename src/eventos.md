---
layout: page
title: Sesiones de f/64
tagline: Eventos anteriores
description: Archivo completo de las pláticas fotográficas de f/64, de noviembre de 2018 a diciembre de 2023. El ciclo concluyó y no habrá nuevas sesiones.
image: /images/f64-publico.jpg
---

<div class="prose md:prose-lg lg:prose-xl">
  <p>
  De noviembre de 2018 a diciembre de 2023 tuvimos la oportunidad de conocer y escuchar distintas voces y distintas maneras de ver y entender la fotografía. Cada primer jueves del mes, una fotógrafa o un fotógrafo presentó su trabajo ante el público.
  </p>

  <p>
  <strong>El ciclo concluyó y no habrá nuevas sesiones.</strong> Este archivo reúne todas las pláticas que se presentaron.
  </p>
</div>

<div class="mt-12 grid grid-cols-1 gap-x-8 gap-y-12 sm:grid-cols-2 lg:grid-cols-3">
  <% all_events.each do |event| %>
    <a href="<%= event_path(event) %>" class="group block">
      <div class="overflow-hidden rounded-md shadow-md">
        <img class="w-full transition duration-300 group-hover:scale-105" src="<%= event.cover %>"
             loading="lazy" alt="<%= event.presenter %>" />
      </div>
      <h2 class="mt-4 font-oswald text-xl font-bold tracking-tight group-hover:text-sky-600">
        <%= event.presenter %>
      </h2>
      <p class="mt-1 text-sm uppercase text-skin-dimmed"><%= event.date %></p>
      <p class="mt-2 line-clamp-3 text-skin-muted"><%= event.tagline %></p>
    </a>
  <% end %>
</div>
