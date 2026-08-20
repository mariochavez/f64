---
layout: default
title: f/64
seo_title: f/64 — Pláticas fotográficas en Colima (2018–2023)
description: Archivo de f/64. 30 pláticas fotográficas en Colima, de noviembre de 2018 a diciembre de 2023, casi siempre el primer jueves del mes.
image: /images/f64.jpg
image_alt: f/64, pláticas fotográficas en Colima
preload_image: /images/home.jpg
---

<%
  ultima = all_events.first
  focus_ring = "focus-visible:outline-2 focus-visible:outline-solid focus-visible:outline-offset-4 focus-visible:outline-skin-accented"
  # The grid shows the presenters' own photographs, so an entry whose photo set
  # never made it into the repo is skipped rather than falling back to its poster.
  recientes = all_events.drop(1).select { |e| (e.photos || []).any? { |p| image_present?(p) } }.first(8)
%>

<div class="bg-white">
  <section class="relative sm:overflow-hidden h-[95vh] flex justify-center items-center" id="top">
    <div class="absolute inset-0">
      <%# A real <img> rather than a CSS background: the background was only
          discovered after the CSSOM was built, which is far too late for the
          element that decides this page's LCP. %>
      <picture>
        <source type="image/webp" srcset="/images/home-640w.webp 640w, /images/home.webp 1800w" sizes="100vw" />
        <img src="/images/home.jpg" alt="" aria-hidden="true" fetchpriority="high" decoding="async"
             width="1800" height="1200" class="h-full w-full object-cover object-center" />
      </picture>
      <div class="absolute inset-0 bg-gray-300 mix-blend-multiply"></div>
    </div>

    <div class="mx-auto max-w-7xl">
      <div class="relative">
        <img src="/images/f64-white.svg" alt="" width="170" height="117" class="mx-auto h-18 w-auto" />
        <%# The h1 names the register. It used to state the schedule instead, so the
            only place the site called itself f/64 in the hero was an image `alt`. %>
        <h1 class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">f/64</span>
          <span class="mx-auto mt-4 block max-w-lg text-center text-xl font-normal uppercase tracking-normal sm:max-w-3xl sm:text-2xl">Pláticas fotográficas en Colima</span>
        </h1>
      </div>
    </div>
  </section>

  <%# The closure statement used to sit here in 18px white over the hero photograph,
      where it measured 4.31:1 against the brightest part of the image — under the
      4.5:1 AA floor, on the one sentence that says the archive is closed. It states
      itself on paper now, and carries the way in with it. %>
  <section aria-labelledby="el-archivo" class="mx-auto max-w-7xl px-4 py-16 sm:px-6 sm:py-24 lg:px-8">
    <h2 id="el-archivo" class="sr-only">El archivo</h2>
    <p class="max-w-3xl text-xl text-skin-muted">
      <strong class="text-skin-base">El ciclo de f/64 concluyó.</strong>
      Fueron <%= all_events.size %> sesiones, de noviembre de 2018 a diciembre de 2023, y no habrá nuevas.
      Este sitio permanece como archivo público de las pláticas que se presentaron.
    </p>
    <a href="/eventos/"
       class="mt-8 inline-flex min-h-11 items-center rounded-md border border-transparent bg-skin-accented px-6 py-2 text-base font-medium text-white shadow-xs hover:bg-skin-accented-hover focus:outline-hidden focus:ring-2 focus:ring-skin-accented focus:ring-offset-2">Ver las <%= all_events.size %> sesiones</a>
  </section>

  <section aria-labelledby="ultima-sesion" class="relative sm:overflow-hidden">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 pb-16 sm:px-6 sm:pb-24 lg:pb-32 lg:px-8">
        <div class="grid grid-cols-1 gap-x-2 sm:grid-cols-2">
          <div>
            <p class="text-sm uppercase text-skin-dimmed">Sesión <%= event_number(ultima) %> de <%= all_events.size %> &middot; la última</p>
            <h2 id="ultima-sesion" class="mt-2 font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
              <a href="<%= event_path(ultima) %>" class="block rounded-md text-skin-accented hover:text-skin-accented-hover <%= focus_ring %>">
                <% if (iso = event_iso_date(ultima)) %>
                  <time datetime="<%= iso %>"><%= ultima.date %></time>
                <% else %>
                  <%= ultima.date %>
                <% end %>
              </a>
            </h2>
            <p class="mt-4 text-sm uppercase text-skin-dimmed">Sede</p>
            <p class="text-base text-skin-muted"><%= event_venue(ultima) %></p>
          </div>
          <div class="mt-6 sm:mt-0">
            <p class="font-oswald text-2xl font-bold tracking-tight sm:text-3xl lg:text-4xl text-left sm:text-right">
              <a href="<%= event_path(ultima) %>" class="rounded-md text-skin-accented hover:text-skin-accented-hover <%= focus_ring %>"><%= ultima.presenter %></a>
            </p>
            <p class="text-xl text-left sm:text-right mt-4 text-skin-muted"><%= ultima.tagline %></p>
          </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 my-10">
          <% ultima.photos.each_with_index do |photo, index| %>
            <figure class="<%= index.zero? ? 'col-span-1 sm:col-span-2' : 'col-span-1' %>">
              <%= render "picture",
                    src: photo,
                    alt: "",
                    classes: "w-full rounded-xs shadow-xs",
                    eager: false,
                    sizes: index.zero? ? "(min-width: 640px) 66vw, 100vw" : "(min-width: 640px) 33vw, 100vw" %>
              <figcaption class="mt-3 text-sm font-bold">© <%= ultima.copyright %></figcaption>
            </figure>
          <% end %>
        </div>
      </div>
    </div>
  </section>

  <%# Decorative only, and carrying no text — so no scrim: DESIGN.md's Scrim-Only
      Rule reserves Velo Denso for photographs that have type on top of them.
      `bg-fixed` is dropped below `md`, where fixed backgrounds repaint on every
      scroll frame and are a known source of mobile jank. %>
  <section class="relative sm:overflow-hidden h-screen" aria-hidden="true">
    <div class="absolute inset-0 bg-photo-publico bg-scroll md:bg-fixed"></div>
  </section>

  <%# No viewport height here: this section holds prose, and `h-screen` with
      `sm:overflow-hidden` silently clipped its last paragraph on any short or
      landscape viewport — 318px of it on a 844x390 phone, with no scrollbar. %>
  <section aria-labelledby="que-fue" class="relative">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <h2 id="que-fue" class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Qué fue f/64</span>
        </h2>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          f/64 fue un evento cuyo objetivo era presentar cada mes —casi siempre el primer jueves— a una fotógrafa o fotógrafo ante el público con su trabajo fotográfico; cada persona que presentó fue libre de elegir el tema y cómo deseaba mostrarlo.
          </p>

          <p>
          El evento siempre fue gratuito y abierto al público. Al terminar la plática quedaba tiempo para una conversación más directa entre los asistentes y la persona invitada, que solía ser la mejor parte de la noche.
          </p>

          <p>
          Creemos que estos espacios son importantes para visibilizar la producción fotográfica, aprender y generar públicos críticos de la imagen.
          </p>
        </div>
      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-[80vh]" aria-hidden="true">
    <div class="absolute inset-0 bg-photo-talks bg-scroll md:bg-fixed"></div>
  </section>

  <section aria-labelledby="sesiones" class="relative sm:overflow-hidden">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <h2 id="sesiones" class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Sesiones de f/64</span>
        </h2>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          Desde 2018 tuvimos la oportunidad de conocer y escuchar distintas voces y distintas maneras de ver y entender la fotografía en Colima.
          </p>
        </div>

        <%# The grid used to show each session's promotional poster — "8:00 PM",
            "Evento Gratuito", an address and a sponsor mark — which read as an
            invitation on the front page of a closed archive. It shows the
            presenters' own photographs now, credited, as the archive intends. %>
        <p class="mt-8 text-sm uppercase text-skin-dimmed">Las <%= recientes.size %> sesiones más recientes</p>
        <ul class="grid grid-cols-1 sm:grid-cols-2 gap-8 mt-4">
          <% recientes.each do |sesion| %>
            <% portada = sesion.photos.find { |p| image_present?(p) } %>
            <li>
              <a href="<%= event_path(sesion) %>" class="group block rounded-md <%= focus_ring %>">
                <figure>
                  <div class="overflow-hidden rounded-md shadow-md">
                    <%= render "picture",
                          src: portada,
                          alt: "",
                          classes: "aspect-[3/2] w-full object-cover transition duration-300 motion-safe:group-hover:scale-105 motion-safe:group-focus-visible:scale-105",
                          eager: false,
                          sizes: "(min-width: 640px) 50vw, 100vw" %>
                  </div>
                  <figcaption class="mt-3 text-sm font-bold">© <%= sesion.copyright %></figcaption>
                </figure>
                <span class="mt-3 block font-oswald text-lg font-bold group-hover:text-skin-accented group-focus-visible:text-skin-accented"><%= sesion.presenter %></span>
                <span class="block text-sm uppercase text-skin-dimmed">
                  Sesión <%= event_number(sesion) %> &middot;
                  <% if (iso = event_iso_date(sesion)) %>
                    <time datetime="<%= iso %>"><%= sesion.date %></time>
                  <% else %>
                    <%= sesion.date %>
                  <% end %>
                </span>
              </a>
            </li>
          <% end %>
        </ul>

        <div class="text-center mt-12">
          <a href="/eventos/"
             class="inline-flex min-h-11 items-center rounded-md border border-transparent bg-skin-accented px-6 py-2 text-base font-medium text-white shadow-xs hover:bg-skin-accented-hover focus:outline-hidden focus:ring-2 focus:ring-skin-accented focus:ring-offset-2">Ver las <%= all_events.size %> sesiones</a>
        </div>

      </div>
    </div>
  </section>

  <section aria-labelledby="cierre" class="relative sm:overflow-hidden h-[60vh] flex justify-center items-center">
    <div class="absolute inset-0 bg-photo-colima bg-scroll md:bg-fixed" aria-hidden="true">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>

    <div class="mx-auto max-w-7xl px-4">
      <div class="relative">
        <%# Was "Evento organizado por equipo de f/64 desde noviembre del 2018." —
            present tense, no end date, and missing the article. It was the last
            thing a visitor read on a page about a series that ended. %>
        <h2 id="cierre" class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Organizado por el equipo de f/64</span>
        </h2>
        <p class="mx-auto max-w-lg mt-6 text-center text-skin-inverted text-xl sm:max-w-3xl uppercase"><%= all_events.size %> sesiones, de noviembre de 2018 a diciembre de 2023</p>
      </div>
    </div>
  </section>
</div>
