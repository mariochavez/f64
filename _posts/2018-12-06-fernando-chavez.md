---
layout: default
title: f64
nombre: "Fernando Chávez"
fotografo: fernando
photoname: fernando-chavez
fecha: "Diciembre 12, 2018"
description: El fotógrafo del pueblo de Comala, él que cuida la tradición.
image: Diciembref64.jpg
address: michelada.io, av. Carranza 1248 Colinas de Santa Bárbara, Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-fernando">
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
            Fernando Chávez, desde mi cámara capturo la fugaz sensación de estar vivo y el movimiento de la Luz en los cielos azules y el multicolor sentido del campo, nací para que la luz me ayudara a hacer el sentido del mundo a través de la fotografía. SOY EL FOTÓGRAFO TRAGALUZ... o cómo bien decía una anciana de Comala.. EL FOTÓGRAFO DEL PUEBLO QUE CUIDA LA TRADICIÓN.
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