#lang racket
(require "carta_211425121_Ignacio_TapiaDonaire.rkt")
(require "tablero_211425121_Ignacio_TapiaDonaire.rkt")
(provide juego
         juego-agregar-jugador
         juego-lanzar-dados
         juego-obtener-jugador-actual
         juego-extraer-carta
         juego-jugar-turno
         get-jugadores
         get-juego-tablero
         get-dinero-banco
         get-total-dados
         juego-turno
         get-impuestos
         get-max-casas
         get-max-hotel
         getDadoRandom
         myRandom
         juego-tablero-propiedades
         juego-tablero-cartas
         juego-tablero-casillas-especiales
         juego-actualizar-jugador)

; Descipción: Constructor que inicializa el juego CAPITALIA
; DOM: player (lista) board (board) dineroBanco (int) numeroDados (int) turnoActual (int) tasaImpuesto (int) maximoCasas (int) maximoHoteles (int) estadoJuego (string)
; REC: juego (lista)
; Tipo recursion: No aplica

(define (juego jugadores board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles )
  (list jugadores board dineroBanco numeroDados turnoActual tasaImpuesto maximoCasas maximoHoteles))

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

; Descripción: Selector que saca el turno actual
; DOM: turnoActual (int)
; REC: turnoActual (int)
; Tipo recursion: no aplcia

(define (juego-turno turnoActual)
  (car (cddddr turnoActual)))

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

; Descripción: Otro que permite ver la cantidad de veces que se repite un dado
; DOM: dado1 (int) dado2 (int) contador (int)
; REC: valor de los dados (int)
; Tipo recursion: recursion de cola

(define (ver-dados-repetidos dado1 dado2 contador)
  ((lambda (dados)
     (cond
       ((>= contador 3) contador)
       ((= (car dados) (cdr dados))
        (ver-dados-repetidos (getDadoRandom (+ dado1 1))
                             (getDadoRandom (+ dado2 1))
                             (+ contador 1)))
       (else contador)))))

; -----------------------------------------------------------------

; Descripción: selector para obtener las propiedades en juego
; DOM: juego (juego)
; REC: juego (tablero)
; Tipo recursion: no aplica

(define (juego-tablero-propiedades juego)
  (car (get-juego-tablero juego)))

; -----------------------------------------------------------------

; Descripción: selector para obtener todas las cartas en juego
; DOM: juego (juego)
; REC: juego (tablero)
; Tipo recursion: no aplica

(define (juego-tablero-cartas juego)
  (list (cadr (get-juego-tablero juego)) (caddr (get-juego-tablero juego))))

; -----------------------------------------------------------------

; Descripción: selector para obtener las casillas especiales en juego
; DOM: juego (juego)
; REC: juego (tablero)
; Tipo recursion: no aplica
 
(define (juego-tablero-casillas-especiales juego)
  (cadddr (get-juego-tablero juego)))

; -----------------------------------------------------------------

; Descripción: modificador que cambia la posicion del jugador en el tablero
; DOM: 
; REC:
; Tipo recursion: no aplica

(define (juego-actualizar-jugador jugadores nuevoJugador)
  (map (lambda (jugador)
         (if (= (car jugador) (car nuevoJugador))
             nuevoJugador
             jugador))
       jugadores))

; -----------------------------------------------------------------

; Descripción:
; DOM:
; REC:
; Tipo recursion:


; -----------------------------------------------------------------

; Descripción: Modificador que permite jugar al juego
; DOM: jugarAhora (juego) dadosJuego (pair)
; REC: juego(juego)
; Tipo recursion: no aplica (por ahora)

(define (juego-jugar-turno juegoActual valorDados comprarPropiedad_or_construirCasa construirHotel pagarMultaSalirCarcel usarTarjetaSalirCarcel)
  (cond
    ((= (car valorDados) (cdr valorDados))
     (ver-dados-repetidos (car valorDados) (cdr valorDados) 0)
     juegoActual)
    (else
     juegoActual)))

; -----------------------------------------------------------------

