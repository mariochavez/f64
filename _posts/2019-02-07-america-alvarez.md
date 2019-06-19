---
layout: default
title: f64
nombre: "América Álvarez"
fotografo: america
photoname: america-alvarez
fecha: "Febrero 7, 2019"
description: Danzante, fotógrafa, pintora y viajera.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-america">
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
            Quien soy es una pregunta básica en mi existencia, después de morir y renacer cada día, busco ser, estando y guiándome entre que la realidad es el sueño y la vida se va en un momento creo las imágenes puras de mi ensueño, a través de la foto reafirmo mi existencia, observo hacia donde va mi mirada, reflejándome a mí misma en lo fotografiado, en el sujeto y en el objeto, en las formas orgánicas e inorgánicas, dejando de pensar caminando por la intuición de la foto me conozco, como una meditación activa, con la fotografía puedo crear ventanas de realidad, portales que me recuerdan que otros mundos pueden ser posibles dentro de una realidad colectiva y todo se convierte en una imagen, dejando la técnica de lado cuando se revela mi forma de ver el mundo, queda en un recuerdo, en un fragmento de tiempo congelado, que me ayuda a recordar quien soy.
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