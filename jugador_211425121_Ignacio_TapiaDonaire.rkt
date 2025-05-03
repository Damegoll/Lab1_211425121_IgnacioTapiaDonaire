#lang racket
(require "juego_211425121_Ignacio_TapiaDonaire.rkt")
(require "propiedad_211425121_Ignacio_TapiaDonaire.rkt")
(provide jugador
         get-jugador-id
         get-jugador-nombre
         get-jugador-dinero
         get-jugador-propiedades
         get-jugador-carcel
         get-cartas-salir-carcel
         jugador-posicion
         jugador-mover
         jugador-comprar-propiedad
         jugador-calcular-renta
         jugador-esta-en-bancarrota
         jugador-pagar-renta)

; -----------------------------------------------------------------

; Descripción: Constructor de los jugadores en CAPITALIA
; DOM: id (int) nombre (string) personaje (string) dinero (int) propiedades (list) posicion (int) estaEnCarcel (boolean) totalCartasSalirCarcecl (int)
; REC: jugador (lista)
; Tipo recursion: no aplica

(define (jugador id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel))

; -----------------------------------------------------------------

; Descripcion: selector del "player" para obtener directamente su id
; DOM: jugador (lista)
; REC: id (string)
; Tipo recursion: no aplica

(define (get-jugador-id jugador)
  (car jugador))

; -----------------------------------------------------------------

; Descripción: selector de "player" para obtener nombre del jugador
; DOM: jugadorNombre (lista)
; REC: nombre (string)
; Tipo recursion: no aplica

(define (get-jugador-nombre jugadorNombre)
  (cadr jugadorNombre))

; -----------------------------------------------------------------

; Descripción: selector de "player" para obtener el dinero del jugador
; DOM: jugadorPlata (player)
; REC: player (lista)
; Tipo recursion: no aplica

(define (get-jugador-dinero jugadorPlata)
  (caddr jugadorPlata))

; -----------------------------------------------------------------

; Descripción: Selector para obtener la lista de propiedades del jugador
; DOM: jugadorPropPropias (jugador)
; REC: propiedades (lista)
; Tipo recursion: no aplica

(define (get-jugador-propiedades jugadorPropPropias)
  (cadddr jugadorPropPropias))

; -----------------------------------------------------------------

; Descripción: Selector para obtener la posicion del jugador
; DOM: jugadorPos (player)
; REC: posicion (int)
; Tipo recursion: no aplica

(define (jugador-posicion jugadorPos)
  (car (cddddr jugadorPos)))

; -----------------------------------------------------------------

; Descripción: Selector para ver si el jugador esta en carcel
; DOM: jugadorCarcel (player)
; REC: estaEnCarcel (boolean)
; Tipo recursion: no aplica

(define (get-jugador-carcel jugadorCarcel)
  (cadr (cddddr jugadorCarcel)))

; -----------------------------------------------------------------

; Descripción: Selector para sacar la cantidad total de cartas para salir de la carcel
; DOM: cartasSalirCarcel (jugador)
; REC: totalCartasSalirCarcel (int)
; Tipo recursion: no aplica

(define (get-cartas-salir-carcel cartasSalirCarcel)
  (caddr (cddddr cartasSalirCarcel)))

; -----------------------------------------------------------------

; Descripción: Modificador para actualizar la posicion del jugador
; DOM: jugadorXD(player) nueva-pos(lista)
; REC: posicion (int)
; Tipo recursion: no aplica

(define (jugador-actualizar-movimiento jugadorXD nueva-pos)
  (jugador
   (get-jugador-id jugadorXD)
   (get-jugador-nombre jugadorXD)
   (get-jugador-dinero jugadorXD)
   (get-jugador-propiedades jugadorXD)
   nueva-pos
   (get-jugador-carcel jugadorXD)
   (get-cartas-salir-carcel jugadorXD)))

; -----------------------------------------------------------------

; Descripción:
; DOM:
; REC:
; Tipo recursion:

(define (jugador-actualizar-dinero jugadorPlatita Platita)
  (jugador
   (get-jugador-id jugadorPlatita)
   (get-jugador-nombre jugadorPlatita)
   (+ (get-jugador-dinero jugadorPlatita) Platita)
   (get-jugador-propiedades jugadorPlatita)
   (jugador-posicion jugadorPlatita)
   (get-jugador-carcel jugadorPlatita)
   (get-cartas-salir-carcel jugadorPlatita)))

; Descripción: Modificador que cambia la posicion del jugador dado el valor de los dados
; DOM: jugador-mover(player) valor-dados(lista) 'pendiente'
; REC: posicion (int)
; Tipo recursion: no aplica

(define (jugador-mover jugador-movimiento valor-dados)
  (cond
    ((eq? (get-jugador-carcel jugador-movimiento) #t) jugador-movimiento)
    (else
     (jugador-actualizar-movimiento jugador-movimiento
                         (+ (jugador-posicion jugador-movimiento)
                            (+ (car valor-dados) (cdr valor-dados)))))))

; -----------------------------------------------------------------

; Descripción: Modificador que permite comprar propiedades en CAPITALIA
; DOM: jugador (jugador) propiedad (propiedad)
; REC: propiedades (lista)
; Tipo recursion: no aplica

(define (jugador-comprar-propiedad jugadorCompra propiedadCompra)
  (cond
    ((eq? (get-propiedad-dueño propiedadCompra) #t) (display "La propiedad ya tiene dueño"))
    ((< (get-jugador-dinero jugadorCompra) (get-propiedad-precio propiedadCompra)) (display "No tienes el dinero suficiente para comprar"))
    (else
     (jugador
      (get-jugador-id jugadorCompra)
      (get-jugador-nombre jugadorCompra)
      (- (get-jugador-dinero jugadorCompra) (get-propiedad-precio propiedadCompra))
      (append (get-jugador-propiedades jugadorCompra) (list propiedadCompra))
      (jugador-posicion jugadorCompra)
      (get-jugador-carcel jugadorCompra)
      (get-cartas-salir-carcel jugadorCompra)))))

; -----------------------------------------------------------------

; Descripción: TDA otro que calcula la renta de una propiedad en base al numero de casas y hoteles
; DOM: jugador (jugador)
; REC: int (monto de renta)
; Tipo recursion: no aplica

(define (jugador-calcular-renta jugadorRenta)
  (apply + (map get-propiedad-renta (get-jugador-propiedades jugadorRenta))))

; -----------------------------------------------------------------

; Descripción: TDA otro que verifica si el jugador se encuentra en bancarrota
; DOM: jugadorBroke (jugador)
; REC: boolean (true/false)
; Tipo recursion: no aplica

(define (jugador-esta-en-bancarrota jugadorBroke)
  (cond
    ((< (get-jugador-dinero jugadorBroke) 0) #t)
    (else
     #f)))

; -----------------------------------------------------------------

; Descripción:
; DOM:
; REC:
; Tipo recursion:

(define (jugador-pagar-renta jugadorPagar jugadorRecibe montoPagar)
   (list
    (jugador-actualizar-dinero jugadorPagar (- montoPagar))
    (jugador-actualizar-dinero jugadorRecibe montoPagar)))