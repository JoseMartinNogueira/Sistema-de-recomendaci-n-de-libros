;;; Modulo principal de utilidades, indicamos que exportamos todo
(defmodule MAIN (export ?ALL))

;;; Modulo de recopilacion de los datos del usuario
(defmodule recopilacion-usuario
	(import MAIN ?ALL)
	(export ?ALL)
)

(defmodule recopilacion-prefs
	(import MAIN ?ALL)
	(import recopilacion-usuario deftemplate ?ALL)
	(export ?ALL)
)

;;; Declaracion de templates --------------------------

;;; Template para los datos socio-demograficos del usuario
(deftemplate MAIN::Usuario
	(slot nombre (type STRING))
	(slot edad (type INTEGER) (default -1))
	;;(multislot idiomas (type INSTANCE))
	;;(nacionalidad)
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	;(slot sagas (type SYMBOL) (default desconocido))
	(multislot idiomas (type INSTANCE))
	;(slot frecuencia (type SYMBOL) (default desconocido))
	;(slot momento (type SYMBOL) (default desconocido))
	(slot lugar (type SYMBOL) (default desconocido))
	(slot libros-populares (type SYMBOL) (default desconocido))
	;(slot valoraciones (type SYMBOL) (default desconocido))
	;(slot autores-extranjeros (type SYMBOL) (default desconocido))
	(multislot subgeneros-cf-favoritos (type INSTANCE)) ; nuevo
    (multislot subgeneros-mist-favoritos (type INSTANCE)) ; nuevo
    (multislot subgeneros-fant-favoritos (type INSTANCE)) ; nuevo
)

;;; Declaracion de funciones --------------------------

;;; Funcion para hacer una pregunta con respuesta cualquiera
(deffunction pregunta-general (?pregunta)
    (format t "%s " ?pregunta)
	(bind ?respuesta (read))
	(while (not (lexemep ?respuesta)) do
		(format t "%s " ?pregunta)
		(bind ?respuesta (read))
    )
	?respuesta
)

;;; Funcion para hacer una pregunta general con una serie de respuestas admitidas
(deffunction MAIN::pregunta-opciones (?question $?allowed-values)
   (format t "%s "?question)
   (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	)
   (printout t ": ")
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (format t "%s "?question)
	  (progn$ (?curr-value $?allowed-values)
		(format t "[%s]" ?curr-value)
	  )
	  (printout t ": ")
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)
   
;;; Funcion para hacer una pregunta de tipo si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)


;;; Funcion para hacer una pregunta con respuesta numerica unica
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

;;; Modulo recopilacion

(defrule recopilacion-usuario::establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
	(not (Usuario))
	=>
	(bind ?nombre (pregunta-general "¿Cómo se llama? "))
	(assert (Usuario (nombre ?nombre)))
)


(defrule recopilacion-usuario::establecer-edad "Establece la edad del usuario"
	?u <- (Usuario (edad ?edad))
	(test (< ?edad 0))
	=>
	(bind ?e (pregunta-numerica "¿Qué edad tiene? " 1 110))
	(modify ?u (edad ?e))
)


(defrule recopilacion-usuario::pasar-a-preferencias "Pasa a la recopilacion de preferencias"
	(declare (salience 10))
	?u <- (Usuario (edad ?e))
	(test (> ?e 0))
	=>
	(focus recopilacion-prefs)
)

(deffacts recopilacion-prefs::hechos-iniciales "Establece hechos para poder recopilar informacion"
	(generos-favoritos ask)
	(preferencias )
)

(defrule recopilacion-prefs::sagas "Establece si le gustan las sagas"
	=>
	(bind ?sagas (pregunta-si-no "¿Le gustan las sagas?"))
	(if (eq ?sagas TRUE) then
		(assert (saga-libros TRUE))
	else 	
		(assert (saga-libros FALSE))
	)
)

(defrule recopilacion-prefs::lugar "Establece el lugar de lectura de preferencia"
	=>
	(bind ?s (pregunta-si-no "¿Va a leer mientras viaja?"))
	(if (eq ?s TRUE) then	
		(assert (transporte-publico TRUE))
	else 
		(assert (transporte-publico FALSE))
	)
)

(defrule recopilacion-prefs::libros-populares "Establece si le gustan los libros populares"
	=>
	(bind ?populares (pregunta-si-no "¿Le gustan los libros populares?"))
	(if (eq ?populares TRUE) then
		(assert (libro-best-seller TRUE))
	else 	
		(assert (libro-best-seller FALSE))
	)
)

(defrule recopilacion-prefs::clasicos-literatura "Establece si le gustan los clasicos de la literatura"
	=>
	(bind ?clasicos (pregunta-si-no "¿Le gustan los clasicos de la literatura?"))
	(if (eq ?clasicos TRUE) then
		(assert (clasico-literatura TRUE))
	else 
		(assert (clasico-literatura FALSE))
	)
)

(defrule recopilacion-prefs::pasar-a-presentacion "Se pasa al modulo de presentacion"
	=>
	(focus procesado)
)

