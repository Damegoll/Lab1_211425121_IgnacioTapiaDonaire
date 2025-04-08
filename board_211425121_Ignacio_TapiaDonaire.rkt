#lang racket
(require "property_211425121_Ignacio_TapiaDonaire.rkt")
(provide board-add-property)
(provide board)






; Descripción: Constructor para guardar la información de las casillas en CAPITALIA
; DOM: property (lista) card-luck (lista) card-community (lista) special-space (lista)
; REC: board (lista)
; Tipo recursion: no aplica

(define (board add-property card-luck card-community special-space)
  (list add-property card-luck card-community special-space))

; -----------------------------------------------------------------

;board-add-property

;Descripción: Modificador para agregar propiedades al tablero
;DOM: board-place (make-board) property-pos (lista de make-property pos)
;REC: make-board (lista)
;Tipo recursion: No aplica


(define (board-add-property board-place new-property pos)
  (list board-place (cons new-property (cons pos null))))