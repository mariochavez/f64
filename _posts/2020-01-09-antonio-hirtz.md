---
layout: default
title: f64
nombre: "Antonio Hirtz"
fotografo: antonio
photoname: antonio-hirtz
fecha: "Enero 9, 2020"
description: Fotógrafo de naturaleza y conservación de fauna
image: Enero20f64.jpg
address: Av. Carranza 1248, Colonia Santa Barbara, 28017 Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-antonio">
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
              {{ page.description }}
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
