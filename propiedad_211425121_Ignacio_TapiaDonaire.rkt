#lang racket
(require "juego_211425121_Ignacio_TapiaDonaire.rkt")
(provide propiedad
         get-propiedad-id
         get-propiedad-nombre
         get-propiedad-precio
         get-propiedad-renta
         get-propiedad-dueño
         get-propiedad-casas
         get-propiedad-eshotel
         get-propiedad-eshipotecada
         propiedad-actualizar-renta
         propiedad-construir-casa
         propiedad-construir-hotel
         propiedad-hipotecar
         propiedad-calcular-renta)

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

; Descripción: Modificador que permite actualizar la renta de la propiedad
; DOM: propiedadRentaNueva (propiedad)
; REC: int (renta)
; Tipo recursion: no aplica

(define (propiedad-actualizar-renta propiedadRentaNueva nuevaRenta)
  (propiedad
   (get-propiedad-id propiedadRentaNueva)
   (get-propiedad-nombre propiedadRentaNueva)
   (get-propiedad-precio propiedadRentaNueva)
   nuevaRenta
   (get-propiedad-dueño propiedadRentaNueva)
   (get-propiedad-casas propiedadRentaNueva)
   (get-propiedad-eshotel propiedadRentaNueva)
   (get-propiedad-eshipotecada propiedadRentaNueva)))

; ------------------------------------------------------------------

; Descripción: Modificador que agrega 1 casa a la propiedad
; DOM: propCasa (propiedad) juegoCasa (juego)
; REC: propiedad (casas)
; Tipo recursion: No aplica

(define (propiedad-construir-casa propCasa juegoCasa)
  (cond
    ((> (+ (get-propiedad-casas propCasa) 1) (get-max-casas juegoCasa)) 
     (display "No se pueden agregar más casas")
     (propiedad
      (get-propiedad-id propCasa)
      (get-propiedad-nombre propCasa)
      (get-propiedad-precio propCasa)
      (get-propiedad-renta propCasa)
      (get-propiedad-dueño propCasa)
      (get-propiedad-casas propCasa)
      (get-propiedad-eshotel propCasa)
      (get-propiedad-eshipotecada propCasa)))
    (else
     (propiedad
      (get-propiedad-id propCasa)
      (get-propiedad-nombre propCasa)
      (get-propiedad-precio propCasa)
      (get-propiedad-renta propCasa)
      (get-propiedad-dueño propCasa)
      (+ (get-propiedad-casas propCasa) 1)
      (get-propiedad-eshotel propCasa)
      (get-propiedad-eshipotecada propCasa)))))

; ------------------------------------------------------------------

; Descripción: Modificador que cambia el estado de hotel a #t y cambia casas a 0
; DOM: propHotel (propiedad) juegoHotel (juego)
; REC: propiedad (esHotel)
; Tipo recursion: No aplica

(define (propiedad-construir-hotel propHotel juegoHotel)
  (cond
    ((or (get-propiedad-eshotel propHotel)
         (< (get-propiedad-casas propHotel) (get-max-casas juegoHotel)))
     propHotel)
    (else
     (propiedad
      (get-propiedad-id propHotel)
      (get-propiedad-nombre propHotel)
      (get-propiedad-precio propHotel)
      (get-propiedad-renta propHotel)
      (get-propiedad-dueño propHotel)
      0
      #t
      (get-propiedad-eshipotecada propHotel)))))

; ------------------------------------------------------------------

; Descripción: Modificador que cambia el estado de la propiedad a hipotecada
; DOM: propHipoteca (propiedad)
; REC: propiedad(estaHipotecada)
; Tipo recursion: no aplica

(define (propiedad-hipotecar propHipoteca)
  (cond
    ((eq? (get-propiedad-eshipotecada propHipoteca) #t)
     display "La propiedad ya fue hipotecada")
    (else
     (propiedad
      (get-propiedad-id propHipoteca)
      (get-propiedad-nombre propHipoteca)
      (get-propiedad-precio propHipoteca)
      (get-propiedad-renta propHipoteca)
      (get-propiedad-dueño propHipoteca)
      (get-propiedad-casas propHipoteca)
      (get-propiedad-eshotel propHipoteca)
      #t))))

; ------------------------------------------------------------------

; Descripción: TDA Otro para calcular la renta de una propiedad
; DOM: propiedadRenta (propiedad)
; REC: int (renta)
; Tipo recursion: no aplica

(define (propiedad-calcular-renta propiedadRenta)
  (cond
    ((eq? (get-propiedad-eshipotecada propiedadRenta) #t)
     (propiedad-actualizar-renta propiedadRenta 0))
    ((eq? (get-propiedad-eshotel propiedadRenta) #t)
     (propiedad-actualizar-renta propiedadRenta
                                 (+(* 2 (+ (get-propiedad-renta propiedadRenta)
                                         (* 0.8 (get-propiedad-renta propiedadRenta))))
                                   (* (get-propiedad-renta propiedadRenta)
                                      (* 0.2 (get-propiedad-casas propiedadRenta))))))
    ((> (get-propiedad-casas propiedadRenta) 0)
     (propiedad-actualizar-renta propiedadRenta
                                 (* (get-propiedad-renta propiedadRenta)
                                    (+ 1 (* 0.2 (get-propiedad-casas propiedadRenta))))))
    (else
     (propiedad-actualizar-renta propiedadRenta
                                 (get-propiedad-renta propiedadRenta)))))

; ------------------------------------------------------------------