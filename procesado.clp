;;; Declaracion de templates --------------------------

;;; Template para una lista de recomendaciones sin orden
(deftemplate MAIN::lista-rec
        (multislot soluciones (type INSTANCE))
)

;;; Template para una lista de recomendaciones con orden
(deftemplate MAIN::lista-rec-ordenada
        (multislot soluciones (type INSTANCE))
)

;;; Fin declaracion de templates ----------------------


;;; Modulo de filtrado y procesado del contenido adequado al usuario
(defmodule procesado
        (import MAIN ?ALL)
        (import recopilacion-usuario deftemplate ?ALL)
        (import recopilacion-prefs deftemplate ?ALL)
        (export ?ALL)
)


;;; Filtrar libros segun el genero---------------------------------------------------


(defrule procesado::anadir-ciencia-ficcion "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Ciencia_ficcion)
        =>
        (bind $?lista (find-all-instances ((?inst Ciencia_ficcion)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

(defrule procesado::anadir-fantasia "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Fantasia)
        =>
        (bind $?lista (find-all-instances ((?inst Fantasia)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

(defrule procesado::anadir-misterio "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Misterio)
        =>
        (bind $?lista (find-all-instances ((?inst Misterio)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

;;;;;------------------------------------------------------------

;-----Cristian
(defrule procesado::aux-subgenero-cf "Crea hechos para poder procesar los subgeneros favoritos"
        (preferencias (subgeneros-cf-favoritos $?gen))
        ?hecho <- (subgenero-cf-favorito ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-cf-favorito ?curr-gen))
                )
        )
)

(defrule procesado::aux-subgenero-mist "Crea hechos para poder procesar los subgeneros favoritos"
        (preferencias (subgeneros-mist-favoritos $?gen))
        ?hecho <- (subgenero-mist-favorito ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-mist-favorito ?curr-gen))
                )
        )
)


(defrule procesado::aux-subgenero-fant "Crea hechos para poder procesar los subgeneros favoritos"
        (preferencias (subgeneros-fant-favoritos $?gen))
        ?hecho <- (subgenero-fant-favorito ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-fant-favorito ?curr-gen))
                )
        )
)



;-----FIN Cristian HECHO

;----------- Jose
(defrule procesado::valorar-edad "Se quitan los libros que no cumplan la recomendacion de edades"
        (Usuario (edad ?e))
        ?rec <- (object (is-a Solucion) (libro ?lib))
        ?cont <-(object (is-a Libro) (edad_recomendada ?min-edad))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (test (< ?e ?min-edad))
        =>
        (send ?rec delete)
)
;------------ FIN
(defrule procesado::valorar-infantil-fantasia "Se mejora la puntuacion de los libros adecuados para personas menores de 12 anyos"
        (Usuario (edad ?e))
        (test (< ?e 13))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?subfant) (edad_recomendada ?edad-min))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (infantil-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subfant) 
                (bind ?nombre (send ?curr-gen get-subgenero_fant))
                (switch ?nombre
                        (case "cuentos_clasicos" then 
                                (bind ?p (+ ?p 150))
                        )
                        (case "magia_y_espada" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "alta_fantasia" then
                                (bind ?p (+ ?p 100))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (infantil-valorado ?cont)) 
)

(defrule procesado::valorar-infantil-ciencia-ficcion "Se mejora la puntuacion de los libros adecuados para personas menores de 12 anyos"
        (Usuario (edad ?e))
        (test (< ?e 13))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf $?subcf) (edad_recomendada ?edad_min))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (infantil-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subcf) 
                (bind ?nombre (send ?curr-gen get-subgenero_cf))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (infantil-valorado ?cont))
)

(defrule procesado::valorar-infantil-misterio "Se mejora la puntuacion de los libros adecuados para personas menores de 12 anyos"
        (Usuario (edad ?e))
        (test (< ?e 13))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?subcf) (edad_recomendada ?edad_min))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (infantil-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subcf) 
                (bind ?nombre (send ?curr-gen get-subgenero_mist))
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (infantil-valorado ?cont))
)


;-----Cristian

(defrule procesado::valorar-adolescente-ciencia-ficcion "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 12) (< ?e 18)))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf $?subcf) (edad_recomendada ?edad_media))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (adolescente-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subcf) 
                (bind ?nombre (send ?curr-gen get-subgenero_cf))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado ?cont))
)

(defrule procesado::valorar-adolescente-fantasia "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 12) (< ?e 18)))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?subfant) (edad_recomendada ?edad_media))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (adolescente-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subfant) 
                (bind ?nombre (send ?curr-gen get-subgenero_fant))
                (switch ?nombre
                        (case "cuentos_clasicos" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "magia_y_espada" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "alta_fantasia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "medieval" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "terror" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado ?cont))
)


(defrule procesado::valorar-adolescente-misterio "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 12) (< ?e 18)))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?submist) (edad_recomendada ?edad_media))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (adolescente-valorado ?cont))
        =>
        (progn$ (?curr-gen $?submist) 
                (bind ?nombre (send ?curr-gen get-subgenero_mist))
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado ?cont))
)


(defrule procesado::valorar-mayor-ciencia-ficcion "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 63))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf $?subcf) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subcf) 
                (bind ?nombre (send ?curr-gen get-subgenero_cf))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (valorado-mayor ?cont))
)


(defrule procesado::valorar-mayor-fantasia "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 18))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?subfant) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado ?cont))
        =>
        (progn$ (?curr-gen $?subfant) 
                (bind ?nombre (send ?curr-gen get-subgenero_fant))
                (switch ?nombre
                        (case "cuentos_clasicos" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "magia_y_espada" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "alta_fantasia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "medieval" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "terror" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (valorado-mayor ?cont))
)

(defrule procesado::valorar-mayor-misterio "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 18))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?submist) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado ?cont))
        =>
        (progn$ (?curr-gen $?submist) 
                (bind ?nombre (send ?curr-gen get-subgenero_mist))
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 125))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (assert (valorado-mayor ?cont))
)



(defrule procesado::valorar-subgenero-favorito-ciencia-ficcion "Se mejora la puntuacion de los libros de los subgeneros de ciencia ficcion favoritos"
        ?hecho <- (subgenero-cf-favorito ?gen)
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf $?generos))
        (test (member$ ?gen $?generos))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (valorado-subgenero-favorito-ciencia-ficcion ?cont ?gen))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Pertenece al género favorito " (send ?gen get-subgenero_cf) " -> +75"))
        (assert (valorado-subgenero-favorito-ciencia-ficcion ?cont ?gen))
)

(defrule procesado::valorar-subgenero-favorito-fantasia "Se mejora la puntuacion de los libros de los subgeneros de fantasia favoritos"
        ?hecho <- (subgenero-fant-favorito ?gen)
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?generos))
        (test (member$ ?gen $?generos))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (valorado-subgenero-favorito-fantasia ?cont ?gen))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Pertenece al género favorito " (send ?gen get-subgenero_fant) " -> +75"))
        (assert (valorado-subgenero-favorito-fantasia ?cont ?gen))
)

(defrule procesado::valorar-subgenero-favorito-misterio "Se mejora la puntuacion de los libros de los subgeneros de misterio favoritos"
        ?hecho <- (subgenero-mist-favorito ?gen)
        ?cont <-(object (is-a Misterio) (subgenero_mist $?generos))
        (test (member$ ?gen $?generos))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (valorado-subgenero-favorito-misterio ?cont ?gen))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Pertenece al género favorito " (send ?gen get-subgenero_mist) " -> +75"))
        (assert (valorado-subgenero-favorito-misterio ?cont ?gen))
)

;;;;;;;;;;;////////////////////////////////
;;;;;;;;;;;////////////////////////////////
;;;;;;;;;;;////////////////////////////////
;;;;;;;;;;;////////////////////////////////

;-----FIN Cristian DONE

;------Jose       ;;; Reglas para procesar sagas, best sellers y autores estranjeros
                ;;; assert necesario saga-libros (TURE/FALSE/INDIFERENTE)
                ;;; assert necesario libro-best-seller(TURE/FALSE/INDIFERENTE)
        ;;; Comentar autores extranjeros (nacionalidad del usuario?)
(defrule procesado::descartar-sagas "Descarta los libros que pertenezcan a sagas"
        (declare (salience 10))
        (saga-libros FALSE)
        ?cont <- (object (is-a Libro) (saga TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        =>
        (send ?rec delete)
)

(defrule procesado::descartar-best-sellers "Descarta los libros que hayan sido nombrados best sellers"
        (declare (salience 10))
        (libro-best-seller FALSE)
        ?cont <- (object (is-a Libro) (best_seller TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
       =>
        (send ?rec delete)
)

;(defrule procesado::descartar-autor-extranjero "Descarta los libros escritos por autores extranjeros"
;        (declare (salience 10))
;        (autor-extranjero FALSE)
;        ?cont <- (object (is-a Libro) (best_seller TRUE))
;        ?rec <- (object (is-a Solucion) (libro ?lib))
;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;        =>
;        (send ?rec delete)
;)

(defrule procesado::descartar-sin-ediciones-de-bolsillo "Descarta los libros sin edicion de bolisllo"
        (declare (salience 10))
        (transporte-publico FALSE)
        ?cont <- (object (is-a Libro) (edicion_bolsillo FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        =>
        (send ?rec delete)
)

(defrule procesado::descartar-calsicos-literatura "Descarta los clasicos de la literatura"
        (declare (salience 10))
        (clasico-literatura FALSE)
        ?cont <- (object (is-a Libro) (clasico-literatura FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        =>
        (send ?rec delete)        
)

(defrule procesado::valorar-saga "Mejora la puntuacion de los libros que pertenezcan a saga"
        (saga-libros TRUE)
        ?cont <- (object (is-a Libro) (saga TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (saga-valorada ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (assert (saga-valorada ?cont))
)

(defrule procesado::valorar-best-seller "Mejora la puntuacion de los libros que hayan sido nombrados best sellers"
        (libro-best-seller TRUE)
        ?cont <- (object (is-a Libro) (best_seller TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (best-seller-valorado ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (assert (best-seller-valorado ?cont))
)

(defrule procesado::valorar-edicion-bolsillo "Mejora la puntuacion de los libros con edicion de bolisllo"
        (libro-best-seller TRUE)
        ?cont <- (object (is-a Libro) (edicion_bolsillo TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (edicion-bolsillo-valorado ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (assert (edicion-bolsillo-valorado ?cont))
)

(defrule procesado::valorar-edicion-bolsillo "Mejora la puntuacion de los clasicos de la literatura"
        (clasico-literatura TRUE)
        ?cont <- (object (is-a Libro) (clasico_literatura TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (clasico-literatura-valorado ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (assert (clasico-literatura-valorado ?cont))
)

;------FIN Jose


;(defrule procesado::descartar-por-idioma "Se descartan los libros que el usuario no va a entender dependiendo de si tienen subtitulos o no"
;        (declare (salience 10)) ; Para tener prioridad y descartar antes
;        (preferencias (idiomas $?idiomas))
;        (vo FALSE)
;        ?cont <- (object (is-a Contenido) (en_idioma ?idioma))
;        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p))
;        (test (eq (instance-name ?cont) (instance-name ?conta)))
;        (test (not (member$ ?idioma $?idiomas)))
;        =>
;        (send ?rec delete)
;)

(defrule procesado::descartar-clasicos "Se descartan contenidos clasicos si no le gustan al usuario"
        (declare (salience 10)) ; Para tener prioridad y descartar antes
        (clasicos FALSE)
        ?cont <- (object (is-a Contenido) (anyo ?anyo))
        (test (<= ?anyo 1965))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        =>
        (send ?rec delete)
)


(defrule procesado::valorar-clasicos "Sube la puntuación de los contenidos clásicos"
        (clasicos TRUE)
        ?cont <- (object (is-a Contenido) (anyo ?a))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (test (<= ?a 1965))
        (not (valorado-clasico ?cont))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Es un contenido clásico -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-clasico ?cont))
)
        
(defrule procesado::pasar-a-generacion "Pasa al modulo de generacion de respuestas"
        (declare(salience -10))
        =>
        (printout t "Generando respuesta..." crlf)
        (focus generacion)
)
