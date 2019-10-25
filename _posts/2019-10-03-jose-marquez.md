---
layout: default
title: f64
nombre: "José A Márquez Gileta"
fotografo: jose
photoname: jose-marquez
fecha: "Octubre 3, 2019"
description: Archivista y conservador nos viene a presentar una restrospectiva del fotógrafo colimense Gustavo Cárdenas quien durante su época prolífica fotografío la vida social colimense.
image: Octubref64.jpg
address: Calle Codorniz No.99 Colonia Santa Barbara, 28017 Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-jose">
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
