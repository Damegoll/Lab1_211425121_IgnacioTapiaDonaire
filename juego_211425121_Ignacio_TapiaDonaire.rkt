#lang racket
(provide juego)
(provide game-add-player)
(provide game-throw-dice)
(provide get-jugadores)
(provide get-juego-tablero)
(provide get-dinero-banco)
(provide get-total-dados)
(provide get-impuestos)
(provide get-max-casas)
(provide get-max-hotel)
(provide get-estado)

; Descipción: Constructor que inicializa el juego CAPITALIA
; DOM: player (lista) board (board) dineroBanco (int) numeroDados (int) turnoActual (int) tasaImpuesto (int) maximoCasas (int) maximoHoteles (int) estadoJuego (string)
; REC: juego (lista)
; Tipo recursion: No aplica

(define (juego game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego)
  (list game-player board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles estadoJuego))

; -----------------------------------------------------------------

; Descripción: Modificador que agrega jugadores a CAPITALIA
; DOM: juegoActual (juego) jugadorNuevo (jugador)
; REC: game-player (juego)
; Tipo recursion: no aplica

(define (game-add-player juegoActual jugadorNuevo)
  (cons (append (car juegoActual) (list jugadorNuevo)) (cdr juegoActual)))

; -----------------------------------------------------------------

; Descripción: Selector que obtiene el turno del jugador actual, implementacion no definitiva
; DOM: jugadorTurno (juego)
; REC: turnoActual (juego)
; Tipo recursion: no aplica

(define (game-get-player-turn jugadorTurno)
  (car jugadorTurno))

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

; Descripción: Selector que saca el estado actual del juego
; DOM: estadoJuegito (juego)
; REC: estadoJuego (string)
; Tipo recursion: no aplica

(define (get-estado estadoJuegito)
  (cadr (cdddr (cddddr estadoJuegito))))

; -----------------------------------------------------------------

; Descripción: TDA de tipo "otro" que tira los dados y los muestra en pantalla
; DOM: Null
; REC: valorDado1 (int) valorDado2 (int)
; Tipo recursion: no aplica

(define game-throw-dice
  (lambda ()
    ((lambda (valor-dado1 valor-dado2) (cons valor-dado1 valor-dado2))
     ((lambda (x) (display "Dado 1: ") (display x) (newline) x) (+ (random 6) 1))
     ((lambda (x) (display "Dado 2: ") (display x) (newline) x) (+ (random 6) 1)))))