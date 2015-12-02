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
	(slot sexo (type SYMBOL) (default desconocido))
	(slot edad (type INTEGER) (default -1))
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
	(slot sagas (type SYMBOL) (default desconocido))
	(slot frecuencia (type SYMBOL) (default desconocido))
	(slot momento (type SYMBOL) (default desconocido))
	(slot lugar (type SYMBOL) (default desconocido))
	(slot libros-populares (type SYMBOL) (default desconocido))
	(slot valoraciones (type SYMBOL) (default desconocido))
	(slot modas (type SYMBOL) (default desconocido))
	(slot autores-extranjeros (type SYMBOL) (default desconocido))
	(multislot generos-favoritos (type INSTANCE))
	(multislot tematicas-favoritas (type INSTANCE))
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

(defrule recopilacion-usuario::establecer-sexo "Establece el sexo del usuario"
	?u <- (Usuario (sexo desconocido))
	=>
	(bind ?s (pregunta-opciones "¿Es hombre o mujer?" hombre mujer))
	(modify ?u (sexo ?s))
)

(defrule recopilacion-usuario::pasar-a-preferencias "Pasa a la recopilacion de preferencias"
	(declare (salience 10))
	?u <- (Usuario (edad ?e) (sexo ~desconocido))
	(test (> ?e 0))
	=>
	(focus recopilacion-prefs)
)

(deffacts recopilacion-prefs::hechos-iniciales "Establece hechos para poder recopilar informacion"
	(generos-favoritos ask)
	(tematicas-favoritas ask)
	(preferencias )
)

(defrule recopilacion-prefs::sagas "Establece si le gustan las sagas"
	?p <- (preferencias (sagas desconocido))
	=>
	(bind ?sagas (pregunta-si-no "¿Le gustan las sagas?"))
	(if (eq ?sagas TRUE) then
		(modify ?p (sagas TRUE))
	else 	
		(modify ?p (sagas FALSE))
	)
)

(defrule recopilacion-prefs::frecuencia "Establece la frecuencia de lectura"
	?p <- (preferencias (frecuencia desconocido))
	=>
	(bind ?s (pregunta-opciones "¿Normalmente lee mucho o poco?" mucho poco))
	(modify ?p (frecuencia ?s))
)
)

(defrule recopilacion-prefs::momento "Establece el momento frecuente de lectura"
	?p <- (preferencias (momento desconocido))
	=>
	(bind ?s (pregunta-opciones "¿En que momento de día prefieres leer?" mañana tarde noche))
	(modify ?p (momento ?s))
)
)


(defrule recopilacion-prefs::lugar "Establece el lugar de lectura de preferencia"
	?p <- (preferencias (lugar desconocido))
	=>
	(bind ?s (pregunta-opciones "¿En que lugar sueles leer más?" cama transporte parque biblioteca nsnc))
	(modify ?p (lugar ?s))
)
)

(defrule recopilacion-prefs::libros-populares "Establece si le gustan los libros populares"
	?p <- (preferencias (libros-populares desconocido))
	=>
	(bind ?populares (pregunta-si-no "¿Le gustan los libros populares?"))
	(if (eq ?populares TRUE) then
		(modify ?p (libros-populares TRUE))
	else 	
		(modify ?p (libros-populares FALSE))
	)
)


(defrule recopilacion-prefs::valoraciones "Establece si se fía de las valoraciones"
	?p <- (preferencias (valoraciones desconocido))
	=>
	(bind ?valoraciones (pregunta-si-no "¿Se fía de las valoraciones?"))
	(if (eq ?valoraciones TRUE) then
		(modify ?p (valoraciones TRUE))
	else 	
		(modify ?p (valoraciones FALSE))
	)
)

(defrule recopilacion-prefs::modas "Establece si se deja llevar por las modas"
	?p <- (preferencias (modas desconocido))
	=>
	(bind ?modas (pregunta-si-no "¿Se deja llevar por las modas?"))
	(if (eq ?modas TRUE) then
		(modify ?p (modas TRUE))
	else 	
		(modify ?p (modas FALSE))
	)
)


(defrule recopilacion-prefs::autores-extranjeros "Establece si prefiere autores extranjeros"
	?p <- (preferencias (autores-extranjeros desconocido))
	=>
	(bind ?extranjeros (pregunta-si-no "¿Prefiere libros de autores extranjeros?"))
	(if (eq ?extranjeros TRUE) then
		(modify ?p (autores-extranjeros TRUE))
	else 	
		(modify ?p (autores-extranjeros FALSE))
	)
)

(defrule recopilacion-prefs::pasar-a-presentacion "Se pasa al modulo de presentacion"
	=>
	(focus procesado)
)

