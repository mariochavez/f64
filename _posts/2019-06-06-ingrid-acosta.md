---
layout: default
title: f64
nombre: "Ingrid Acosta"
fotografo: ingrid
photoname: ingrid-acosta
fecha: "Junio 6, 2019"
description: Soy fotógrafa, realizadora documental y activista.
image: Juniof64.jpg
address: michelada.io, av. Carranza 1248 Colinas de Santa Bárbara, Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-ingrid">
    {% include header.html %}
  
    <div class="hero-body">
      <div class="container">
        <h2 class="subtitle has-text-white">
          {{ page.fecha }}
        </h2>
        <h1 class="title has-text-white">
          {{ page.nombre }}
        </h1>
      </div>
    </div>
  </section>

  <section id="f64" class="hero is-white f64">
    <div class="hero-body">
      <div class="columns">
        <div class="column">
          <div class="column is-three-fifths">
            <h3>{{ page.nombre }}</h3>
            <h1>La fotógrafa</h1>
          </div>
          <div class="column is-three-fifths">
            <p>
            Fotografío como una reafirmación de mi ahora y un homenaje de lo que fui.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <section class="hero is-white event">
    <div class="hero-body">
      {% include photographer.html %}
    </div>
  </section>
  
  {% include event-photos.html %}
</div>