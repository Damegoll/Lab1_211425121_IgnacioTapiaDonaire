#lang racket

; Descripción: Constructor para las cartas del juego CAPITALIA
; DOM: id (int) tipo (string) descripcion (string) accion (funcion)
; REC: card (lista)
; Tipo recursión: No aplica

(define (card id tipo descripcion accion)
  (list id tipo descripcion accion))