#lang racket

; Descripcion: contiene las propiedades del tablero en si mismo
; Dominio: property (lista) card-luck (lista) card-community (lista) special-space (lista)
; Recorrido: board (lista)
; Tipo recursion: no aplica

(define (board property card-luck card-community special-space)
  (list property card-luck card-community special-space))