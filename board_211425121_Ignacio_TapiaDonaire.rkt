#lang racket
(require "property_211425121_Ignacio_TapiaDonaire.rkt")
(provide board)
(provide board-add-property)





; Descripción: Constructor para guardar la información de las casillas en CAPITALIA
; DOM: property (lista) card-luck (lista) card-community (lista) special-space (lista)
; REC: board (lista)
; Tipo recursion: no aplica

(define (board add-property card-luck card-community special-space)
  (list add-property card-luck card-community special-space))

; -----------------------------------------------------------------

; board-add-property
; Descripcion: Modificador que agrega las propiedades al tablero del juego CAPITALIA
; DOM: tableroActual (lista) prop (property) pos (int)
; REC: board (board)
; Tipo recursion: no aplica

(define (board-add-property tableroActual prop pos)
  (cons (append (car tableroActual) (list prop)) (cdr tableroActual)))

; -----------------------------------------------------------------
