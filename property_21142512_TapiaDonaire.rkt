#lang racket

;Nombre: property
;Descripcion: permite crear propiedades para el juego CAPITALIA
;Dominio: id (int) nombre (string) precio (int) renta (int) color (string)
;dueño (jugador/null/boolean?) casas (int) esHotel (boolean) estaHipotecada (boolean)
;Recorrido: property (lista)
;Tipo TDA: Constructor

(define (property id nombre precio renta color dueño casas esHotel estaHipotecada)
  (list id nombre precio renta color dueño casas esHotel estaHipotecada))