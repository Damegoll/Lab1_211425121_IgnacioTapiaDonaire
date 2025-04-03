#lang racket

; Descripción: Constructor para crear las propiedades dentro de CAPITALIA
; DOM: id (int) nombre (string) precio (int) renta (int) color (string) dueño (jugador/null/boolean?) casas (int) esHotel (boolean) estaHipotecada (boolean)
; REC: property (lista)
; Tipo recursion: no aplica

(define (property id nombre precio renta color dueño casas esHotel estaHipotecada)
  (list id nombre precio renta color dueño casas esHotel estaHipotecada))