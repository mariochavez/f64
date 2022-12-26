---
layout: default
title: f64
image: /images/f64.jpg
---

<div class="bg-white">
  <section class="relative shadow-xl sm:overflow-hidden h-[95vh] flex justify-center items-center" id="top">
    <!-- Image -->
    <div class="absolute inset-0 bg-[url('/images/home.jpg')] bg-cover bg-center bg-no-repeat bg-fixed">
      <div class="absolute inset-0 bg-gray-300 mix-blend-multiply"></div>
    </div>

    <!-- Content -->
    <div class="mx-auto max-w-7xl">
      <div class="relative">
        <img src="/images/f64-white.svg" class="mx-auto h-18 w-auto" />
        <p class="mx-auto mt-6 max-w-lg text-center text-skin-inverted text-xl sm:max-w-3xl uppercase">Pláticas fotográficas</p>
        <h1 class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Cada primer jueves del mes</span>
        </h1>
        <div class="text-center mt-16">
          <a href="/no-bienal" class="inline-flex items-center rounded-md border border-transparent bg-sky-600 px-6 py-2 text-base font-bold uppercase text-white shadow-sm hover:bg-sky-700 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2">Convocatoria No Bienal Colima 2023</a>
        </div>
      </div>
    </div>
  </section>

  <% event = site.data.events.first %>
  <section class="relative sm:overflow-hidden" id="next-event">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
         <div class="grid grid-cols-1 gapx-2 sm:grid-cols-2">
          <div>
            <p class="text-xl uppercase">Próximo evento</p>
            <h1 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
              <span class="block"><%= event.date %></span>
            </h1>
            <p class="mt-4 text-md"><%= event.address %></p>
          </div>
          <div class="mt-6 sm:mt-0">
            <h2 class="font-oswald text-2xl font-bold tracking-tight sm:text-3xl lg:text-4xl text-left sm:text-right"><%= event.presenter %></h2>
            <p class="text-xl text-left sm:text-right mt-4"><%= event.tagline %></p>
          </div>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4 my-10">
          <% event.photos.each_with_index do |photo, index| %>
            <div class="relative <%= index == 0 ? 'col-span-1 sm:col-span-2' : 'col-span-1' %>">
              <img class="rounded-sm shadow-sm" src="<%= photo %>" loading="lazy" />
              <p class="font-bold mt-3 text-sm">© <%= event.copyright %></p>
              <div class="absolute inset-0 bg-gray-50 opacity-0 mix-blend-multiply"></div>
            </div>
          <% end %>
        </div>
      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-screen">
    <div class="absolute inset-0 bg-[url('/images/f64-publico.jpg')] bg-cover bg-center bg-no-repeat bg-fixed">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-screen">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <p class="mt-6 text-xl uppercase">Pláticas fotográficas</p>
        <h1 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">f/64</span>
        </h1>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          f/64 es un evento cuyo objetivo es presentar cada primer jueves del mes a una fotógrafa o fotógrafo a presentar ante público su trabajo fotográfico, cada persona que presenta es libre de elegir el tema y como lo desea mostrar.
          </p>

          <p>
          El evento es gratuito y para público en general interesado en conocer sobre el quehacer fotográfico, anécdotas y motivaciones, y al final de la charla, tener la oportunidad de una conversación más directa y personal entre los asistentes y la persona invitada.
          </p>

          <p>
          Creemos que estos espacios son importantes para visibilizar la producción fotográfica, aprender y generar públicos críticos de la imagen.
          </p>
        </div>
      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-[80vh]">
    <div class="absolute inset-0 bg-[url('/images/talks.jpg')] bg-cover bg-center bg-no-repeat bg-fixed">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden">
    <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
      <div class="relative px-4 py-16 sm:px-6 sm:py-24 lg:py-32 lg:px-8">
        <p class="mt-6 text-xl uppercase">Eventos anteriores</p>
        <h1 class="font-oswald text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Sesiones de f/64</span>
        </h1>

        <div class="prose md:prose-lg lg:prose-xl mt-12">
          <p>
          Desde el 2018 hemos tenido la oportunidad de conocer y escuchar distintas voces y distintas maneras de ver y entender la fotografía.
          </p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 mt-8">
          <% site.data.events.slice(1..4).each do |event| %>
            <div class="relative">
              <img class="rounded-md shadow-md" src="<%= event.cover %>" loading="lazy" alt="<%= event.presenter %>" />
              <div class="absolute inset-0 bg-gray-50 opacity-0 mix-blend-multiply"></div>
            </div>
          <% end %>
        </div>

        <div class="text-center mt-8">
          <button type="button" class="inline-flex items-center rounded-md border border-transparent bg-sky-600 px-6 py-2 text-base font-medium text-white shadow-sm hover:bg-sky-700 focus:outline-none focus:ring-2 focus:ring-sky-500 focus:ring-offset-2">Ver más eventos pasados</button>
        </div>

      </div>
    </div>
  </section>

  <section class="relative sm:overflow-hidden h-[60vh] flex justify-center items-center">
    <div class="absolute inset-0 bg-[url('/images/colima.jpg')] bg-cover bg-center bg-no-repeat bg-fixed">
      <div class="absolute inset-0 bg-gray-600 mix-blend-multiply"></div>
    </div>

    <div class="mx-auto max-w-7xl">
      <div class="relative">
        <h1 class="font-oswald text-skin-inverted text-4xl text-center font-bold tracking-tight sm:text-5xl lg:text-6xl">
          <span class="block">Evento organizado por equipo de f/64 <br/>desde noviembre del 2018.</span>
        </h1>
        <p class="mx-auto max-w-lg mt-6 text-center text-skin-inverted text-xl sm:max-w-3xl uppercase">Pláticas fotográficas</p>
      </div>
    </div>
  </section>
</div>
