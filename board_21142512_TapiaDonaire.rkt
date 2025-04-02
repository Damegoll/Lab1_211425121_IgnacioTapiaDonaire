#lang racket

;Nombre: board
;Descripcion: contiene las propiedades del tablero en si mismo
;Dominio: property (lista) card-luck (lista) card-community (lista) special-space (lista)
;Recorrido: board (lista)
;Tipo: Constructor

(define (board property card-luck card-community special-space)
  (list property card-luck card-community special-space))

;testing
(define empty-board (board '() '() '() '()))
empty-board