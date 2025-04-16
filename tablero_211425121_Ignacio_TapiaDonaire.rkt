#lang racket
(require "propiedad_211425121_Ignacio_TapiaDonaire.rkt")
(provide tablero)
(provide board-add-property)
(provide get-tablero-propiedades)
(provide get-carta-suerte)
(provide get-carta-comunidad)
(provide get-casilla-especial)


; Descripción: Constructor para guardar la información de las casillas en CAPITALIA
; DOM: property (lista) card-luck (lista) card-community (lista) special-space (lista)
; REC: tablero (lista)
; Tipo recursion: no aplica

(define (tablero add-property card-luck card-community special-space)
  (list add-property card-luck card-community special-space))

; -----------------------------------------------------------------

; Descripcion: Modificador que agrega las propiedades al tablero del juego CAPITALIA
; DOM: tableroActual (tablero) prop (propiedad) pos (int)
; REC: add-property (tablero)
; Tipo recursion: no aplica

(define (board-add-property tableroActual prop pos)
  (cons (append (car tableroActual) (list prop)) (cdr tableroActual)))

; -----------------------------------------------------------------

; Descripción: Selector que permite elegir la lista de propiedades del tablero
; DOM: tableroPropiedades (tablero)
; REC: add-property (lista)
; Tipo recursion: no aplica

(define (get-tablero-propiedades tableroPropiedades)
  (car tableroPropiedades))

; -----------------------------------------------------------------

; Descripción: Selector que elige la lista de cartas de la suerte del tablero
; DOM: tableroSuerte (tablero)
; REC: card-luck (lista)
; Tipo recursion: no aplica

(define (get-carta-suerte tableroSuerte)
  (cadr tableroSuerte))

; -----------------------------------------------------------------

; Descripción: Selector que selecciona las cartas de comunidad del tablero
; DOM: tableroComunidad (tablero)
; REC: card-community (lista)
; Tipo recursion: no aplica

(define (get-carta-comunidad tableroComunidad)
  (caddr tableroComunidad))

; -----------------------------------------------------------------

; Descripción: Selector que elige la casilla especial del tablero
; DOM: tableroCasillaEsp (tablero)
; REC: special-space (lista)
; Tipo recursion: no aplica

(define (get-casilla-especial tableroCasillaEsp)
  (cadddr tableroCasillaEsp))

; -----------------------------------------------------------------