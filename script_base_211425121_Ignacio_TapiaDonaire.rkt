#lang racket
(require "carta_211425121_Ignacio_TapiaDonaire.rkt")
(require "juego_211425121_Ignacio_TapiaDonaire.rkt")
(require "jugador_211425121_Ignacio_TapiaDonaire.rkt")
(require "propiedad_211425121_Ignacio_TapiaDonaire.rkt")
(require "tablero_211425121_Ignacio_TapiaDonaire.rkt")

; 1. Creación de jugadores
;; TDA Jugador = id X nombre X dinero X propiedades X posicionActual X estaEnCarcel X totalCartasSalirEnCarcel
(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))

; 2. Creación de propiedades para el juego
; TDA Propiedad = id X nombre X precio X renta X dueño X casas X esHotel X estaHipotecada
(define prop1 (propiedad 1 "Paseo Mediterráneo" 60 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 60 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 140 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 180 14 #f 0 #f #f))


; 3. Creación de cartas de suerte y arca comunal
; TDA Carta =
(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))


(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))


 ; 4. Creación del tablero
; TDA Tablero = 
(define tablero-vacio (tablero '() 
                              (list chance1 chance2 chance3) 
                              (list community1 community2 community3)
                              (list (cons 'salida 0) (cons 'carcel 10) (cons 'suerte 7) (cons 'comunidad 17))))






; Lista de propiedades con sus posiciones
(define lista-propiedades 
  (list (cons prop1 1) (cons prop2 3) (cons prop3 6)
        (cons prop4 8) (cons prop5 9) (cons prop6 11)
        (cons prop7 13) (cons prop8 14)))

; Tablero con propiedades
;; Funcion tablero-agregar-propiedad
(define tablero-completo (tablero-agregar-propiedad tablero-vacio lista-propiedades))


; 5. Creación del juego
; TDA Juego = 
(define g0 (juego '() tablero-completo 20000 2 0 10 4 1 "preparacion"))

; 6. Agregar jugadores al juego
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))

; 7. Jugar
(display "===== CAPITALIA =====\n\n")

; Turno 1: Carlos
(display "TURNO 1: Carlos\n")

(define semilla-1 12345) ; => (3 . 4) [Dados: 3 y 4]
(define dados-carlos (juego-lanzar-dados semilla-1))

(define p1-movido (jugador-mover p1 dados-carlos g2))
; => #(1 "Carlos" 1500 () 7 #f 0) [Avanza a la posición 7]


(define posicion-carlos (jugador-posicion p1-movido))
(define prop-carlos (tablero-obtener-propiedad tablero-completo posicion-carlos))
(define p1-actualizado (jugador-comprar-propiedad p1-movido prop-carlos))
(define g3 (juego-actualizar-jugador g2 p1-actualizado))
(define prop-carlos-actualizada (propiedad-actualizar-dueno prop-carlos 1))
(define g4 (juego-actualizar-propiedad g3 prop-carlos-actualizada))