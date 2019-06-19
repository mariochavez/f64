---
layout: default
title: f64
nombre: "Javier Flores"
fotografo: javier
photoname: javier-flores
fecha: "Abril 4, 2019"
description: Fotógrafo que se ha dedicado a capturar la vida cotidiana de Colima y sus alrededores.
image: Abrilf64.jpg
address: michelada.io, av. Carranza 1248 Colinas de Santa Bárbara, Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-javier">
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
            <h1>El fotógrafo</h1>
          </div>
          <div class="column is-three-fifths">
            <p>
            Fotógrafo que se ha dedicado a capturar la vida cotidiana de Colima y sus alrededores, siempre en su mirada los personajes, la comida y las fiestas populares.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="hero is-white event">
    <div class="hero-body">
      <a name="eventos"></a>
      {% include photographer.html %}
    </div>
  </section>

  {% include event-photos.html %}
</div>
