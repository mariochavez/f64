---
layout: default
title: f64
nombre: "Hernando Rivera"
fotografo: hernando
photoname: hernando-rivera
fecha: "Marzo 7, 2019"
description: Fotógrafo de naturaleza apasionado por la conservación y los paisajes nocturnos y la fauna silvestre.
image: marzof64.png
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-hernando">
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
            Fotógrafo de naturaleza apasionado por la conservación y los paisajes nocturnos y la fauna silvestre.
            </p>
            <p>
            Reconocido fotógrafo colimense con múltiples premios nacionales e internacionales gracias a sus impresionanetes fotografías del Volcán de Colima.
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