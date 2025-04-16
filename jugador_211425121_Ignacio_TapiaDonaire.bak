#lang racket
(require "propiedad_211425121_Ignacio_TapiaDonaire.rkt")
(require "juego_211425121_Ignacio_TapiaDonaire.rkt")
(provide jugador)
(provide get-player)
(provide get-player-name)




; Descripción: Constructor de los jugadores en CAPITALIA
; DOM: id (int) nombre (string) personaje (string) dinero (int) propiedades (list) posicion (int) estaEnCarcel (boolean) totalCartasSalirCarcecl (int)
; REC: jugador (lista)
; Tipo recursion: no aplica

(define (jugador id nombre personaje dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre personaje dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel))

; -----------------------------------------------------------------

; get-player
; Descripcion: selector del "player" para obtener directamente su id
; DOM: jugador (lista)
; REC: id (player)
; Tipo recursion: no aplica

(define (get-player jugador)
  (car jugador))

; -----------------------------------------------------------------

; get-player-name
; Descripción: selector de "player" para obtener nombre del jugador
; DOM: jugadorNombre (lista)
; REC: nombre (player)
; Tipo recursion: no aplica

(define (get-player-name jugadorNombre)
  (cadr jugadorNombre))

; -----------------------------------------------------------------

; get-player-money
; Descripción: selector de "player" para obtener el dinero del jugador
; DOM: jugadorPlata (player)
; REC: player (player)
; Tipo recursion: no aplica

(define (get-player-money jugadorPlata)
  (cadddr jugadorPlata))

; -----------------------------------------------------------------

; get-player-pos
; Descripción: Selector para obtener la posicion del jugador
; DOM: jugadorPos (player)
; REC: posicion (player)
; Tipo recursion: no aplica

(define (get-player-pos jugadorPos)
  (list-ref jugadorPos 5))

; -----------------------------------------------------------------

; player-carcel
; Descripción: Selector para ver si el jugador esta en carcel
; DOM: jugadorCarcel (player)
; REC: estaEnCarcel (player)
; Tipo recursion: no aplica

(define (player-carcel jugadorCarcel)
  (list-ref jugadorCarcel 6))

; -----------------------------------------------------------------

; player-update-move
; Descripción: Modificador para actualizar la posicion del jugador
; DOM: jugadorXD(player) nueva-pos(lista)
; REC: posicion (player)
; Tipo recursion: no aplica

(define (player-update-move jugadorXD nueva-pos)
  (list
   (list-ref jugadorXD 1)
   (list-ref jugadorXD 2)
   (list-ref jugadorXD 3)
   (list-ref jugadorXD 4)
   nueva-pos
   (list-ref jugadorXD 6)
   (list-ref jugadorXD 7)))

; -----------------------------------------------------------------

; player-move
; Descripción: 
; DOM: jugador-mover(player) valor-dados(lista) 'pendiente'
; REC: posicion (player)
; Tipo recursion: no aplica

(define (player-move jugador-mover valor-dados)
  (cond
    ((eq? (player-carcel jugador-mover) #t) (display "Usted no puede moverse, se encuentra en la carcel")
                                            jugador-mover)
    (else
     (player-update-move jugador-mover
                         (+ (get-player-pos jugador-mover)
                            (+ (car valor-dados)
                               (cdr valor-dados)))))))

; -----------------------------------------------------------------

; player-add-property
; Descripcion: Modificador que agrega la propiedad al jugador respectivo
; DOM:
; REC:
; Tipo recursion:

#|(define (player-add-property jugadorCasitalinda laCasitalinda)
  ())
|#
; Descripción: (NO APLICADO) Modificador que permite comprar propiedades en CAPITALIA
; DOM: jugadorCompra (jugador) casaCompra (propiedad)
; REC: propiedades (jugador)
; Tipo recursion: no aplica

(define (player-comprar-casita jugadorCompra casaCompra)
  (if (eq? (get-property-dueño casaCompra) #f)
      (if (< (get-player-money jugadorCompra) (get-property-price casaCompra)) 
          (display "no hay plata, erai") 
          (- (get-player-money jugadorCompra) (get-property-price casaCompra))) 
      null))

; -----------------------------------------------------------------