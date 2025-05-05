#lang racket

(require "main_21142512_Ignacio_TapiaDonaire.rkt")

; Creacion de jugadores

(define p1 (jugador 1 "Joaquin" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Maximiliano" 1500 '() 0 #f 0))
(define p3 (jugador 3 "Gustavo" 1500 '() 0 #f 0))

; Creacion de propiedades

(define prop1 (propiedad 1 "Paseo Ahumada" 500 100 #f 0 #f #f))
(define prop2 (propiedad 2 "Plaza Papu" 600 120 #f 0 #f #f))
(define prop3 (propiedad 3 "Casa del Alfajor" 620 150 #f 0 #f #f))
(define prop4 (propiedad 4 "Casa de John Usach" 700 300 #f 0 #f #f))
(define prop5 (propiedad 5 "Parque Robert Lox" 200 60 #f 0 #f #f))
(define prop6 (propiedad 6 "Museo de Jesus" 100 30 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida Sonriente" 800 320 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Triste" 300 100 #f 0 #f #f))
(define prop9 (propiedad 9 "Parque del Olvido" 900 370 #f 0 #f #f))
(define prop10 (propiedad 10 "Memorial 'Ramos no Aprobados'" 1000 500 #f 0 #f #f))
(define prop11 (propiedad 11 "Paseo Paradigmas" 1100 550 #f 0 #f #f))
(define prop12 (propiedad 12 "Calle Santiasco" 50 5 #f 0 #f #f))
(define prop13 (propiedad 13 "Maipu, literal Maipu" 2000 800 #f 0 #f #f))
(define prop14 (propiedad 14 "Trozo minusculo de la Usach" 1500 700 #f 0 #f #f))
(define prop15 (propiedad 15 "Avenida Asalto" 450 150 #f 0 #f #f))

; Creacion de cartas de suerte y comunidad

(define chance1 (carta 1 "suerte" "Avanza a la salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Retroceda 2 casillas" 'retroceder-casillas))
(define chance3 (carta 3 "suerte" "Vas directamente a la carcel" 'ir-a-carcel))
(define chance4 (carta 4 "suerte" "Avanza 5 casillas" 'avanzar-casillas))
(define chance5 (carta 5 "suerte" "No hace nada, literal nada" 'hacer-nada))
(define chance6 (carta 6 "suerte" "Te dan 100$" 'dinero-dar))
(define chance7 (carta 7 "suerte" "Te quitan 20$" 'dinero-quitar))
(define chance8 (carta 8 "suerte" "Avanzas 1 casilla" 'avanzar-casillas))
(define chance9 (carta 9 "suerte" "Retroceda 4 casillas" 'retroceder-casillas))
(define chance10 (carta 10 "suerte" "Te dan 50$" 'dinero-dar))

(define comunidad1 (carta 1 "comunidad" "El banco se equivoca y te da 50$" 'banco-paga))
(define comunidad2 (carta 2 "comunidad" "Es tu cumpleaños, recibe 20$ de cada jugador" 'jugadores-pagan))
(define comunidad3 (carta 3 "comunidad" "El SII te a pillado, pagas 50$ por cada propiedad" 'jugador-paga))
(define comunidad4 (carta 4 "comunidad" "Evades impuestos y sale bien, gana 100$" 'banco-paga))
(define comunidad5 (carta 5 "comunidad" "Apuestas todo al rojo y pierdes 200$" 'jugador-paga))
(define comunidad6 (carta 6 "comunidad" "Apuestas todo al negro y ganas 400$" 'jugador-recibe))
(define comunidad7 (carta 7 "comunidad" "Ganas una carta para salir de la carcel!" 'salir-carcel))
(define comunidad8 (carta 8 "comunidad" "Te llevan los carabineros por malandro, vas a la carcel" 'ir-a-carcel))
(define comunidad9 (carta 9 "comunidad" "El banco te da 100$ por tus inversiones" 'banco-paga))
(define comunidad10 (carta 10 "comunidad" "La bolsa cae, pierdes 150" 'jugador-paga))

; Creacion de tablero

(define tablero-vacio 
  (tablero '()
           (list chance1 chance2 chance3 chance4 chance5 chance6 chance7 chance8 chance9 chance10)
           (list comunidad1 comunidad2 comunidad3 comunidad4 comunidad5 comunidad6 comunidad7 comunidad8 comunidad9 comunidad10)
           (list 
              (cons 'salida 0)
              (cons 'carcel 7)  
              (cons 'carcel 14) 
              (cons 'suerte 15)
              (cons 'suerte 5)
              (cons 'comunidad 8))))

; Lista de propiedades

(define lista-propiedades 
  (list (cons prop1 1) (cons prop2 2) (cons prop3 3)
        (cons prop4 4) (cons prop5 6) (cons prop6 9)
        (cons prop7 10) (cons prop8 11) (cons prop9 12)
        (cons prop10 13)))

; Tablero con propiedades

(define tablero-completo (tablero-agregar-propiedad tablero-vacio lista-propiedades))

; Creacion del juego

(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))

; Agregar jugadores

(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))
(define g3 (juego-agregar-jugador g2 p3))

; Seteo de dados

(getDadoRandom 1) ; retorna 1
(getDadoRandom 2) ; retorna 2
(getDadoRandom 5) ; retorna 3
(getDadoRandom 0) ; retorna 4
(getDadoRandom 3) ; retorna 5
(getDadoRandom 4) ; retorna 6

; Jugar

(display "===== CAPITALIA =====\n\n")

; Primer turno, toca Joaquin

(display "TURNO 1: Joaquin\n")

(define g4 (juego-jugar-turno g3 (juego-lanzar-dados 1 5) #t #f #f #f))
g4