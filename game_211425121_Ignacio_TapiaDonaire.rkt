#lang racket
(require "player_211425121_Ignacio_TapiaDonaire.rkt")
(provide game)
(provide game-add-player)







; Descipción: Constructor que inicializa el juego CAPITALIA
; DOM: player (lista) board (board) dineroBanco (int) numeroDados (int) turnoActual (int) tasaImpuesto (int) maximoCasas (int) maximoHoteles (int) estadoJuego (string)
; REC: game (lista)
; Tipo recursion: No aplica

(define (game game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)
  (list game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego))

; -----------------------------------------------------------------

; Descripción: Modificador que agrega jugadores a CAPITALIA
; DOM: juegoActual (game) jugadorNuevo (player)
; REC: game (game)
; Tipo recursion: no aplica

(define (game-add-player juegoActual jugadorNuevo)
  (cons (append (car juegoActual) (list jugadorNuevo)) (cdr juegoActual)))
