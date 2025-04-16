#lang racket
(provide propiedad)
(provide get-property-dueño)
(provide get-property-price)

; Descripción: Constructor para crear las propiedades dentro de CAPITALIA
; DOM: id (int) nombre (string) precio (int) renta (int) color (string) dueño (jugador/null/boolean?) casas (int) esHotel (boolean) estaHipotecada (boolean)
; REC: juego (lista)
; Tipo recursion: no aplica

(define (propiedad id nombre precio renta color dueño casas esHotel estaHipotecada)
  (list id nombre precio renta color dueño casas esHotel estaHipotecada))

; ---------------------------------------

; get-property-price
; Descripción: Selector para obtener el coste de la propiedad
; DOM: casaPrecio (propiedad)
; REC: precio (propiedad)
; Tipo recursion: no aplica

(define (get-property-price casaPrecio)
  (caddr casaPrecio))

; -----------------------------------------------------------------

; get-property-dueño
; Descripción: selector para ver si la propiedad tiene dueño
; DOM: verDueño (propiedad)
; REC: dueño (propiedad)
; Tipo recursion: no aplica

(define (get-property-dueño verDueño)
  (list-ref verDueño 5))

; -----------------------------------------------------------------

; cambiar-prop-dueño
; cambiar a que la propiedad ahora tiene dueño
; va a ser una paja porque tengo que dupear todo el juego y decirle "oye ahora tiene casa"


; ------------------------------------------------------------------