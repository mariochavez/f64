---
layout: default
title: f64
nombre: "Massiel Hernández"
fotografo: massiel
photoname: massiel-hernandez
fecha: "Mayo 2, 2019"
description: Soy fotógrafa, realizadora documental y activista.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-massiel">
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
            Mi trabajo está inspirado en la búsqueda de nuevas narrativas que visibilicen a las mujeres en su cotidianidad, sus luchas y sus realidades.
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