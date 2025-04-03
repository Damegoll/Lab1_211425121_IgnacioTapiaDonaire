#lang racket

; Descripción: Constructor de los jugadores en CAPITALIA
; DOM: id (int) nombre (string) dinero (int) propiedades (list) posicion (int) estaEnCarcel (boolean) totalCartasSalirCarcecl (int)
; REC: player (lista)
; Tipo recursion: no aplica

(define (player id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades estaEnCarcel totalCartasSalirCarcel))