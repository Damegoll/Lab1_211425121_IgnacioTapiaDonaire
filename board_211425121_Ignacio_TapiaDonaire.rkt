#lang racket

; Descripción: Constructor para guardar la información de las casillas en CAPITALIA
; DOM: property (lista) card-luck (lista) card-community (lista) special-space (lista)
; REC: board (lista)
; Tipo recursion: no aplica

(define (board property card-luck card-community special-space)
  (list property card-luck card-community special-space))