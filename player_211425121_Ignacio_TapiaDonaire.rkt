#lang racket
(require "property_211425121_Ignacio_TapiaDonaire.rkt")
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

; get-player-money
; Descripción: selector de "player" para obtener el dinero del jugador
; DOM: jugadorPlata (player)
; REC: player (player)
; Tipo recursion: no aplica

(define (get-player-money jugadorPlata)
  (cadddr jugadorPlata))

; -----------------------------------------------------------------

; player-add-property
; Descripcion: Modificador que agrega la propiedad al jugador respectivo
; DOM:
; REC:
; Tipo recursion:

#|(define (player-add-property jugadorCasitalinda laCasitalinda)
  ())
|#
; Descripción: TDA de tipo "otro" que tira los dados, saca su suma y los muestra en pantalla
; DOM: Null
; REC: valorDado1 (int) valorDado2 (int)
; Tipo recursion: no aplica

(define (player-comprar-casita jugadorCompra casaCompra)
  (if (eq? (get-property-dueño casaCompra) #f)
      (if (< (get-player-money jugadorCompra) (get-property-price casaCompra)) 
          (display "no hay plata, erai") 
          (- (get-player-money jugadorCompra) (get-property-price casaCompra))) 
      null))

; -----------------------------------------------------------------

(define prop1 (property 1 "Paseo Mediterráneo" 60 2 "marrón" #f 0 #f #f))
(define p1 (player 1 "Carlos" "Carro" 60 '() 0 #f 0))
