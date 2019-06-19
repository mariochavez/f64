---
layout: default
title: f64
nombre: "Gustavo Vilchis"
fotografo: vilchis
photoname: gustavo-vilchis
fecha: "Noviembre 8, 2018"
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro">
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
            Gustavo Vilchis originario de Guerrero, fotógrafo documentalista, activista y viajero.
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  {% include event-photos.html %}
</div>