#lang racket
(provide carta
         get-carta-id
         get-carta-tipo
         get-carta-descripcion
         get-carta-accion)

; Descripción: Constructor para las cartas del juego CAPITALIA
; DOM: id (int) tipo (string) descripcion (string) accion (funcion)
; REC: carta (lista)
; Tipo recursión: No aplica

(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))

; -----------------------------------------------------------------

; Descripción: Selector que saca la id de la carta
; DOM: cartaId (carta)
; REC: id (int)
; Tipo recursion: no aplica

(define (get-carta-id cartaId)
  (car cartaId))

; -----------------------------------------------------------------

; Descripción: Selector que extrae el tipo de carta
; DOM: cartaTipo (carta)
; REC: tipo (string)
; Tipo recursion: no aplica

(define (get-carta-tipo cartaTipo)
  (cadr cartaTipo))

; -----------------------------------------------------------------

; Descripción: Selector que saca la descripcion de la carta
; DOM: cartaDesc (carta)
; REC: descripcion (string)
; Tipo recursion: no aplica

(define (get-carta-descripcion cartaDesc)
  (caddr cartaDesc))

; -----------------------------------------------------------------

; Descripción: Selector que extrae la accion de la carta
; DOM: cartaAccion (carta)
; REC: accion (funcion)
; Tipo recursion: no aplica

(define (get-carta-accion cartaAccion)
  (cadddr cartaAccion))

; -----------------------------------------------------------------