#lang racket
(provide propiedad)
(provide get-propiedad-id)
(provide get-propiedad-nombre)
(provide get-propiedad-precio)
(provide get-propiedad-renta)
(provide get-propiedad-dueño)
(provide get-propiedad-casas)
(provide get-propiedad-eshotel)
(provide get-propiedad-eshipotecada)

; Descripción: Constructor para crear las propiedades dentro de CAPITALIA
; DOM: id (int) nombre (string) precio (int) renta (int) color (string) dueño (jugador/null/boolean?) casas (int) esHotel (boolean) estaHipotecada (boolean)
; REC: juego (lista)
; Tipo recursion: no aplica

(define (propiedad id nombre precio renta dueño casas esHotel estaHipotecada)
  (list id nombre precio renta dueño casas esHotel estaHipotecada))

; ----------------------------------------------------------------

; Descripción: Selector para sacar la id de la propiedad
; DOM: idProp (propiedad)
; REC: id (int)
; Tipo recursion: no aplica

(define (get-propiedad-id idProp)
  (car idProp))

; -----------------------------------------------------------------

; Descripción: Selector que saca el nombre de la propiedad
; DOM: propNombre (propiedad)
; REC: nombre (string)
; Tipo recursion: no aplica

(define (get-propiedad-nombre propNombre)
  (cadr propNombre))

; -----------------------------------------------------------------

; Descripción: Selector para obtener el coste de la propiedad
; DOM: casaPrecio (propiedad)
; REC: precio (int)
; Tipo recursion: no aplica

(define (get-propiedad-precio casaPrecio)
  (caddr casaPrecio))

; -----------------------------------------------------------------

; Descripción: Selector para ver la renta de la propiedad
; DOM: propRenta (propiedad)
; REC: renta (int)
; Tipo recursion: no aplica

(define (get-propiedad-renta propRenta)
  (cadddr propRenta))

; -----------------------------------------------------------------

; Descripción: selector para ver si la propiedad tiene dueño
; DOM: verDueño (propiedad)
; REC: dueño (propiedad)
; Tipo recursion: no aplica

(define (get-propiedad-dueño verDueño)
  (car (cddddr verDueño)))

; -----------------------------------------------------------------

; Descripción: Selector para tener el total de casas de la propiedad
; DOM: propCasas (propiedad)
; REC: casas (int)
; Tipo recursion: no aplica

(define (get-propiedad-casas propCasas)
  (cadr (cddddr propCasas)))

; -----------------------------------------------------------------

; Descripción: Selector para ver si la casa es hotel
; DOM: propHotel (jugador)
; REC: esHotel (boolean)
; Tipo recursion: no aplica

(define (get-propiedad-eshotel propHotel)
  (caddr (cddddr propHotel)))

; -----------------------------------------------------------------

; Descripción: Selector para ver si la casa fue hipotecada
; DOM: propHipoteca (jugador)
; REC: estaHipotecada (boolean)
; Tipo recursion: no aplica

(define (get-propiedad-eshipotecada propHipotecada)
  (cadddr (cddddr propHipotecada)))

; -----------------------------------------------------------------

; cambiar-prop-dueño
; cambiar a que la propiedad ahora tiene dueño
; va a ser una paja porque tengo que dupear todo el juego y decirle "oye ahora tiene casa"


; ------------------------------------------------------------------

; Descripción: Modificador que agrega 1 casa a la propiedad
; DOM: propCasa (propiedad) juegoCasa (juego)
; REC: propiedad (casas)
; Tipo recursion: No aplica

(define (propiedad-construir-casa propCasa juegoCasa)
  (cond
    ((> (+ (get-propiedad-casas propCasa) 1) (get-max-casas juegoCasa)) 
     (display "No se pueden agregar más casas"))
    (else
     (+ (get-propiedad-casas propCasa) 1))))

; ------------------------------------------------------------------