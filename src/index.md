---
layout: default
title: f/64
seo_title: f/64 — Pláticas fotográficas en Colima (2018–2023)
description: Archivo de f/64. 30 pláticas fotográficas en Colima, de noviembre de 2018 a diciembre de 2023, una cada primer jueves del mes.
image: /images/f64.jpg
image_alt: f/64, pláticas fotográficas en Colima
preload_image: /images/home.jpg
---

<div class="bg-white">
  <section class="relative shadow-xl sm:overflow-hidden h-[95vh] flex justify-center items-center" id="top">
    <!-- Image -->
    <div class="absolute inset-0">
      <%# A real <img> rather than a CSS background: the background was only
          discovered after the CSSOM was built, which is far too late for the
          element that decides this page's LCP. %>
      <picture>
        <source type="image/webp" srcset="/images/home.webp" />
        <img src="/images/home.jpg" alt="" aria-hidden="true" fetchpriority="high" decoding="async"
             width="1800" height="1200" class="h-full w-full object-cover object-center" />
      </picture>
      <div class="absolute inset-0 bg-gray-300 mix-blend-multiply"></div>
    </div>

    <!-- Content -->
    <div class="mx-auto max-w-7xl">
      <div class="relative">
        <img src="/images/f64-white.svg" alt="f/64" width="170" height="117" class="mx-auto h-18 w-auto" />
        <h1 class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="mx-auto mt-6 mb-2 block max-w-lg text-center text-xl font-normal uppercase tracking-normal sm:max-w-3xl">Pláticas fotográficas en Colima</span>
          <span class="block">Cada primer jueves del mes</span>
        </h1>
        <p class="mx-auto mt-8 max-w-2xl text-center text-skin-inverted text-lg">
          2018 &ndash; 2023. El ciclo de f/64 concluyó. No habrá nuevas sesiones; este sitio permanece como archivo de las pláticas que se presentaron.
        </p>
      </div>
    </div>
  </section>

  <% event = site.data.events.first %>
  <section class="relative sm:overflow-hidden" id="last-event">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
         <div class="grid grid-cols-1 gap-x-2 sm:grid-cols-2">
          <div>
            <p class="text-xl uppercase">Último evento</p>
            <h2 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
              <a href="<%= event_path(event) %>" class="block hover:text-sky-600">
                <% if (iso = event_iso_date(event)) %>
                  <time datetime="<%= iso %>"><%= event.date %></time>
                <% else %>
                  <%= event.date %>
                <% end %>
              </a>
            </h2>
            <p class="mt-4 text-base"><%= event.address %></p>
          </div>
          <div class="mt-6 sm:mt-0">
            <h3 class="font-oswald text-2xl font-bold tracking-tight sm:text-3xl lg:text-4xl text-left sm:text-right">
              <a href="<%= event_path(event) %>" class="hover:text-sky-600"><%= event.presenter %></a>
            </h3>
            <p class="text-xl text-left sm:text-right mt-4"><%= event.tagline %></p>
          </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 my-10">
          <% event.photos.each_with_index do |photo, index| %>
            <div class="relative <%= index == 0 ? 'col-span-1 sm:col-span-2' : 'col-span-1' %>">
              <%= render "picture",
                    src: photo,
                    alt: "Fotografía #{index + 1} de #{event.presenter}, última sesión de f/64 en Colima",
                    classes: "rounded-xs shadow-xs",
                    eager: false %>
              <p class="font-bold mt-3 text-sm">© <%= event.copyright %></p>
              <div class="absolute inset-0 bg-gray-50 opacity-0 mix-blend-multiply"></div>
            </div>
          <% end %>
        </div>
      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-screen" aria-hidden="true">
    <%# Decorative only. `bg-fixed` is dropped below `md` — background-attachment:
        fixed repaints on every scroll frame and is a known source of mobile jank. %>
    <div class="absolute inset-0 bg-photo-publico bg-scroll md:bg-fixed">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-screen">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <p class="mt-6 text-xl uppercase">Pláticas fotográficas</p>
        <h2 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Qué fue f/64</span>
        </h2>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          f/64 fue un evento cuyo objetivo era presentar cada primer jueves del mes a una fotógrafa o fotógrafo ante el público con su trabajo fotográfico; cada persona que presentó fue libre de elegir el tema y cómo deseaba mostrarlo.
          </p>

          <p>
          El evento fue gratuito y abierto al público en general interesado en conocer sobre el quehacer fotográfico, anécdotas y motivaciones, y al final de la charla, tener la oportunidad de una conversación más directa y personal entre los asistentes y la persona invitada.
          </p>

          <p>
          Creemos que estos espacios son importantes para visibilizar la producción fotográfica, aprender y generar públicos críticos de la imagen.
          </p>
        </div>
      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-[80vh]" aria-hidden="true">
    <div class="absolute inset-0 bg-photo-talks bg-scroll md:bg-fixed">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <p class="mt-6 text-xl uppercase">Eventos anteriores</p>
        <h2 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Sesiones de f/64</span>
        </h2>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          Desde 2018 tuvimos la oportunidad de conocer y escuchar distintas voces y distintas maneras de ver y entender la fotografía en Colima.
          </p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 mt-8">
          <% site.data.events.slice(1..8).each do |past_event| %>
            <%# These covers looked clickable but weren't, which left all 30 event
                pages with a single inbound link, from `/eventos/`. %>
            <a href="<%= event_path(past_event) %>" class="group relative block">
              <%= render "picture",
                    src: past_event.cover,
                    alt: "#{past_event.presenter}, sesión de f/64 en Colima, #{past_event.date}",
                    classes: "rounded-md shadow-md",
                    eager: false %>
              <span class="mt-3 block font-oswald text-lg font-bold group-hover:text-sky-600"><%= past_event.presenter %></span>
              <span class="block text-sm uppercase text-skin-dimmed"><%= past_event.date %></span>
            </a>
          <% end %>
        </div>

        <div class="text-center mt-8">
          <a href="/eventos/" class="inline-flex items-center rounded-md border border-transparent bg-sky-600 px-6 py-2 text-base font-medium text-white shadow-xs hover:bg-sky-700 focus:outline-hidden focus:ring-2 focus:ring-sky-500 focus:ring-offset-2">Ver las <%= all_events.size %> sesiones</a>
        </div>

      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-[60vh] flex justify-center items-center">
    <div class="absolute inset-0 bg-photo-colima bg-scroll md:bg-fixed" aria-hidden="true">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>

    <div class="mx-auto max-w-7xl">
      <div class="relative">
        <h2 class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Evento organizado por equipo de f/64 <br/>desde noviembre del 2018.</span>
        </h2>
        <p class="mx-auto max-w-lg mt-6 text-center text-skin-inverted text-xl sm:max-w-3xl uppercase">Pláticas fotográficas</p>
      </div>
    </div>
  </section>
</div>
