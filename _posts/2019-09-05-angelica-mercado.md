---
layout: default
title: f64
nombre: "Angélica Mercado"
fotografo: angelica
photoname: angelica-mercado
fecha: "Septiembre 5, 2019"
description: Cuando fotografío, me lleno el ojo. Todo se palpa, se escucha, se contacta sin tocar. He conocido la fotografía de frente y por dentro, me he perdido a  propósito con ella, solo para ver hasta dónde me lleva.
image: Septiembref64.jpg
address: Calle Codorniz No.99 Colonia Santa Barbara, 28017 Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-angelica">
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
