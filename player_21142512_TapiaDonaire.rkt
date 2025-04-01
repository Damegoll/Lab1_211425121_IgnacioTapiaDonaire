#lang racket

;Nombre: player
;Descripcion: crea al jugador del juego CAPITALIA
;Dominio: id (int) nombre (string) dinero (int) propiedades (list) posicion (int) estaEnCarcel (boolean) totalCartasSalirCarcecl (int)
;Recorrido: player (lista)
;Tipo TDA: Constructor 
(define (player id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades estaEnCarcel totalCartasSalirCarcel))