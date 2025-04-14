#lang racket
(provide player)
(provide get-player)
(provide get-player-name)




; Descripción: Constructor de los jugadores en CAPITALIA
; DOM: id (int) nombre (string) personaje (string) dinero (int) propiedades (list) posicion (int) estaEnCarcel (boolean) totalCartasSalirCarcecl (int)
; REC: player (lista)
; Tipo recursion: no aplica

(define (player id nombre personaje dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre personaje dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel))

; -----------------------------------------------------------------

; get-player
; Descripcion: selector del "player" para obtener directamente su id
; DOM: jugador (lista)
; REC: player (player)
; Tipo recursion: no aplica

(define (get-player jugador)
  (car jugador))

; -----------------------------------------------------------------

; get-player-name
; Descripción: selector de "player" para obtener nombre del jugador
; DOM: jugadorNombre (lista)
; REC: player (player)
; Tipo recursion: no aplica

(define (get-player-name jugadorNombre)
  (cadr jugadorNombre))

; -----------------------------------------------------------------