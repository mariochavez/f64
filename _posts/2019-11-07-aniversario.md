---
layout: default
title: f64
nombre: "Aniversario: Omar Martínez y Miguel Dimayuga"
fotografo: aniversario
photoname: aniversario
fecha: "Noviembre 7, 2019"
description: Sesión de aniversario con los fotoperiodistas Omar Martínez de la Agencia Cuartoscuro y Miguel Dimayuga del semanario Proceso
image: aniversario.jpg
address: Calle Vicente Guerrero No.35 Colonia Centro, Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-aniversario">
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
            <h1>Los fotoperiodistas</h1>
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
      <div class="columns">
        <div class="column">
          <h3>{{page.proximo}} Evento</h3>
          <h1>{{page.fecha}}</h1>
          <h4>7:45pm en {{ page.address }}</h4>
        </div>
        <div class="column is-three-fifths">
          <p><b>{{page.nombre}}</b>, {{page.description}}</p>
        </div>
      </div>

      <div class="images columns">
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/omar-martinez-1.jpg' | absolute_url}}" alt="Omar Martínez">
          <h3>&copy; Omar Martínez, Cuartoscuro</h3>
        </div>
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/miguel-dimayuga-1.jpg' | absolute_url}}" alt="Miguel Dimayuga">
          <h3>&copy; Miguel Dimayuga, Proceso</h3>
        </div>
      </div>

      <div class="images columns">
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/miguel-dimayuga-2.jpg' | absolute_url}}" alt="Miguel Dimayuga">
          <h3>&copy; Miguel Dimayuga, Proceso</h3>
        </div>
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/omar-martinez-2.jpg' | absolute_url}}" alt="Omar Martínez">
          <h3>&copy; Omar Martínez, Cuartoscuro</h3>
        </div>
      </div>

      <div class="images columns">
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/omar-martinez-3.jpg' | absolute_url}}" alt="Omar Martínez">
          <h3>&copy; Omar Martínez, Cuartoscuro</h3>
        </div>
        <div class="column is-half">
          <div class="photo-overlay"></div>
          <img src="{{'/images/aniversario/miguel-dimayuga-3.jpg' | absolute_url}}" alt="Miguel Dimayuga">
          <h3>&copy; Miguel Dimayuga, Proceso</h3>
        </div>
      </div>

    </div>
  </section>

  {% include event-photos.html %}
</div>
