---
layout: default
title: f64
nombre: "Neddy Palacios"
fotografo: neddy
photoname: neddy-palacios
fecha: "Enero 3, 2019"
description: Fotógrafa del proceso tradicional de buscar, encontrar, disparar, descubrir, revelar y develar.
image: enerof64.jpg
address: michelada.io, av. Carranza 1248 Colinas de Santa Bárbara, Colima.
---
<div class="parallax-container">
  <section class="hero is-large has-text-centered parallax intro intro-neddy">
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
            Neddy Palacios, originaria de Colima, se ha dedicado a la fotografía de 15 años a la fecha y en la búsqueda de un punto de vista propio, de la realidad a través de la cámara, ha encontrado que en la expresió gestual de la gente se concentra la esencia de su ser.
            </p>
            <p>
            “El retrato es una huella de vida”.
            Si bien ha transitado por el paisaje, por el desnudo, por la naturaleza muerta, etc., Neddy ha podido descubrir el valor del retrato como expresión genuina del existir de las personas. Nada mejor para develar el momento existencial de alguien que un retrato oportuno.
            </p>
            <p>
            “El retrato es una confesión, es el alma de un personaje congelada en una imagen”
            El interés de Neddy Palacios por afinar su sensibilidad para la fotografía de retrato, la ha obligado a indagar en los rostros que le son conocidos, por lo mismo más difíciles de explorar, ya que, lo que vemos a diario lo dejamos de admirar y en consecuencia desaprovechamos su sustancia.
            </p>
            <p>
            “La costumbre ciega al ojo”
            En este sentido, el retrato familiar es siempre un reto para quien, a través de los suyos, pretende descubrirse y reconocerse.
            </p>
            <p>
            Por otra parte, para poder explorar a fondo el lenguaje fotográfico y desarrollar un discurso personal con la imagen, a Neddy le ha sido indispensable el ejercicio del registro cotidiano disponiéndose al hallazgo y reusándose a la tentadora mecanización a la que invita el avance tecnológico, que inhibe la madurez del ojo del fotógrafo.
            </p>
            <p>
            “Toda cámara fotográfica, por si sola es ciega; para registrar la vida a través de su lente, requiere de la sensibilidad del ojo vivo del fotógrafo”.
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