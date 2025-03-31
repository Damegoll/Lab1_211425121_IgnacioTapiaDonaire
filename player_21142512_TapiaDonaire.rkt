#lang racket

#|
IMPORTANTE: cons es una de las funciones nativas de racket para poder crear
PARES en este caso, tambien existe la funcion list para hacer, bueno, listas

car -> accede al primer elemento encontrado en el par o lista
cdr -> accede al 2do y posteriores elementos del par o la lista
*notar que cdr se debe invocar n-1 veces para una lista de n elementos y asi llegar
al final de la misma, osea, si la lista es de largo 5, se ocupa cdr 4 veces
para poder acceder al elemento final de este
|#


;Constructor 
(define (player id nombre dinero propiedades posicion estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades estaEnCarcel totalCartasSalirCarcel))