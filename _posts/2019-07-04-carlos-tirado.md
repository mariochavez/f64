---
layout: default
title: f64
nombre: "Carlos Tirado"
fotografo: carlos
photoname: carlos-tirado
fecha: "Julio 4, 2019"
description: Gusto por la fotografía urbana, de paisaje, retrato, moda, etc. Enfocado en aprender más de un tipo de fotografía
image: Juliof64.jpg
address: Casa Volcán, Venustiano Carranza 56 - A, 28450 Comala.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-carlos">
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
              Gusto por la fotografía urbana, de paisaje, retrato, moda, etc. Enfocado en aprender más de un tipo de fotografía.
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
