#lang racket
(require "carta_211425121_Ignacio_TapiaDonaire.rkt")
(provide juego
         juego-agregar-jugador
         juego-lanzar-dados
         juego-obtener-jugador-actual
         juego-extraer-carta
         get-jugadores
         get-juego-tablero
         get-dinero-banco
         get-total-dados
         get-impuestos
         get-max-casas
         get-max-hotel
         getDadoRandom
         myRandom)

; Descipción: Constructor que inicializa el juego CAPITALIA
; DOM: player (lista) board (board) dineroBanco (int) numeroDados (int) turnoActual (int) tasaImpuesto (int) maximoCasas (int) maximoHoteles (int) estadoJuego (string)
; REC: juego (lista)
; Tipo recursion: No aplica

(define (juego game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles )
  (list game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles))

; -----------------------------------------------------------------

; Descripción: Modificador que agrega jugadores a CAPITALIA
; DOM: juegoActual (juego) jugadorNuevo (jugador)
; REC: game-player (juego)
; Tipo recursion: no aplica

(define (juego-agregar-jugador juegoActual jugadorNuevo)
  (cons (append (car juegoActual) (list jugadorNuevo)) (cdr juegoActual)))

; -----------------------------------------------------------------

; Descripción: Selector que obtiene el turno del jugador actual
; DOM: jugadorTurno (juego)
; REC: turnoActual (juego)
; Tipo recursion: no aplica

(define (juego-obtener-jugador-actual juegoNow)
  (car (car juegoNow)))

; -----------------------------------------------------------------

; Descripción: Selector que extrae los jugadores de la partida
; DOM: juegoJugadores (juego)
; REC: game-player (lista)
; Tipo recursion: no aplica

(define (get-jugadores juegoJugadores)
  (car juegoJugadores))

; -----------------------------------------------------------------

; Descripción: Selector que saca los tableros del juego
; DOM: juegoTablero (juego)
; REC: board (lista)
; Tipo recursion: no aplica

(define (get-juego-tablero juegoTablero)
  (cadr juegoTablero))

; -----------------------------------------------------------------

; Descripción: Selector que saca el dinero total del banco en juego
; DOM: dineroBanco (juego)
; REC: dineroBanco (int)
; Tipo recursion: no aplica

(define (get-dinero-banco dineroBanco)
  (caddr dineroBanco))

; -----------------------------------------------------------------

; Descripción: Selector que saca el numero total de dados en juego
; DOM: totalDados (juego)
; REC: numeroDados (int)
; Tipo recursion: no aplica

(define (get-total-dados totalDados)
  (cadddr totalDados))

; -----------------------------------------------------------------

; Descripción: Selector que saca la tasa de impuesto del juego
; DOM: ricosImpuestos (juego)
; REC: tasaImpuesto (int)
; Tipo recursion: no aplica

(define (get-impuestos ricosImpuestos)
  (cadr (cddddr ricosImpuestos)))

; -----------------------------------------------------------------

; Descripción: Selector que saca la cantidad maxima de casas que se pueden tener por propiedad
; DOM: maximoCasitas (juego)
; REC: maximoCasas (int)
; Tipo recursion: no aplica

(define (get-max-casas maximoCasitas)
  (caddr (cddddr maximoCasitas)))

; -----------------------------------------------------------------

; Descripción: Selector que saca la cantidad maxima de hoteles que se pueden tener por propiedad
; DOM: maximoHotel (juego)
; REC: maximoHoteles (int)
; Tipo recursion: no aplica

(define (get-max-hotel maximoHotel)
  (cadddr (cddddr maximoHotel)))

; -----------------------------------------------------------------

; Descripción: Otro que simula la funcion random
; DOM: null
; REC: null
; Tipo recursion: no aplica

(define (myRandom X)
  (modulo (+ (* 1103515245 X) 12345) 2147483648))

; -----------------------------------------------------------------

; Descripción: Otro que recibe la semilla y obtiene un resultado predeterminado
; DOM: null
; REC: myRandom (int)
; Tipo recursion: No aplica

(define (getDadoRandom seed)
  (+ 1 (modulo (myRandom seed) 6)))

; -----------------------------------------------------------------

; Descripción: TDA de tipo "otro" que tira los dados y los muestra en pantalla
; DOM: seed-dado1 (int) seed-dado2 (int)
; REC: valorDado1 (int) valorDado2 (int)
; Tipo recursion: no aplica

(define (juego-lanzar-dados seed-dado1 seed-dado2)
  (cons
   ((lambda (dado1)
      (display "Dado 1: ") (display dado1) (newline)
      dado1)
    (getDadoRandom seed-dado1))
   ((lambda (dado2)
      (display "Dado 2: ") (display dado2) (newline)
      dado2)
    (getDadoRandom seed-dado2))))

; -----------------------------------------------------------------

; Descripción: Modificador que extrae una carta no aleatoria del mazo especificado
; DOM: juegoCarta (juego) mazoSacar (string)
; REC: carta (tipo)
; Tipo recursion: no aplica

(define juego-extraer-carta
  (lambda (juego tipo)
    (cond
      ((string=? tipo "suerte")
       (list-ref (cadr (cadr juego)) (modulo (myRandom (getDadoRandom 2)) (length (cadr (cadr juego))))))
      ((string=? tipo "comunidad")
       (list-ref (caddr (cadr juego)) (modulo (myRandom (getDadoRandom 3)) (length (caddr (cadr juego))))))
      (else
       (display "de alguna manera escogiste algo que no existe, eres un genio")))))
; en caso de querer hacerla random verdaderamente debemos de quitar el myRandom y getDadoRandom y reemplazarlos con random a secas

; -----------------------------------------------------------------

; Descripción: Modificador que permite jugar al juego
; DOM: jugarAhora (juego) dadosJuego (pair)
; REC: juego(juego)
; Tipo recursion: no aplica (por ahora)

#|(define (juego-jugar-turno juegoActual valorDados comprarPropiedad_or_construirCasa construirHotel pagarMultaSalirCarcel usarTarjetaSalirCarcel)
  (cond
    ((eq? comprarPropiedad_or_construirCasa #t)
     ())))|#