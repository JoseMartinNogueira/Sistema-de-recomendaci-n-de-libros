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
	;(multislot idiomas (type INSTANCE))
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

(deffunction pregunta-multi (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los números separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (str-explode ?resp))
    (bind $?lista (create$ ))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 1) (<= ?var (length$ ?valores-posibles))))
            then 
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        ) 
    )
    ?lista
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
	(generos-libros ask)
	(subgenero-fant-fav ask)
	(subgenero-cf-fav ask)
	(subgenero-mist-fav ask)
	(saga-libros ask)
	(transporte-publico ask)
	(libro-best-seller ask)
	(cf-hard ask)
	(preferencias )
)

(defrule recopilacion-prefs::preguntar-generos "Establece los generos que le gustaira leer al lector"
	?gen <- (generos-libros ask)
	=>
	(bind ?generos-libros (create$ "Fantasia" "Ciencia ficcion" "Misterio"))
	(bind ?respuesta (pregunta-multi "¿Que genero(s) le gustaria leer? (Fantasia/Ciencia ficcion/Misterio)"))
	(progn$ (?res ?respuesta)
		(switch ?res
			(case 1
				then
				(assert (genero-libro Fantasia))
			)
			(case 2
				then
				(assert (genero-libro Ciencia_ficcion))
				(assert (cf-hard ask))
			)
			(case 3
				then 
				(assert (genero-libro Misterio))
			)
		)
	)
	(retract ?gen)
	(assert (generos-libros TRUE))
)

(defrule recopilacion-prefs::relacionado-misterio "Descarta preguntas no relacionadas con Misterio"
	(generos-libros TRUE)
	(not (genero-libro Ciencia_ficcion|Fantasia))
	=>
	(assert (cf-hard no-ask))
	(assert (subgenero-cf-fav FALSE))
	(assert (subgenero-fant-fav FALSE))
)

(defrule recopilacion-prefs::relacionado-fantasia "Descarta preguntas no relacionadas con fantasia"
	(generos-libros TRUE)
	(not (genero-libro Ciencia_ficcion|Misterio))
	=>
	(assert (cf-hard no-ask))
	(assert (subgenero-cf-fav FALSE))
	(assert (subgenero-mist-fav FALSE))
)

(defrule recopilacion-prefs::relacionado-fantasia "Descarta preguntas no relacionadas con ciencia ficcion"
	(generos-libros TRUE)
	(not (genero-libro Fantasia|Misterio))
	=>
	(assert (subgenero-fant-fav FALSE))
	(assert (subgenero-mist-fav FALSE))
)

(defrule recopilacion-prefs::pregunta-subgeneros-fant-fav "Pregunta al usuario"
	?hecho <- (subgenero-fant-fav ask)
	(genero-libro Fantasia)
	=>
	(bind ?res (pregunta-si-no "¿Algun subgenero de fantasia es su favorito?"))
	(retract ?hecho)
	(if (eq ?res TRUE)
		then
		(assert (subgenero-fant-fav elegir))
	else 
		(assert (subgenero-fant-fav FALSE))
	)		
)

(defrule recopilacion-prefs::seleccionar-sub-fant-fav "Establece los generos de fantasia favoritos del usuario"
	?hecho <- (subgenero-fant-fav elegir)
	?pref <- (preferencias)
 	=>
 	(bind $?all-sub-fant (find-all-instances ((?inst Subgenero_fantasia)) TRUE))
 	(bind $?n-subgeneros (ceate $ ))
 	(loop-for-count (?i 1 (length$ $?all-sub-fant)) do
 		(bind ?obj (nth$ ?i ?all-sub-fant))
 		(bind ?nombre (send ?obj get-subgenero_fantasia))
 		(bind $?n-subgeneros(insert$ $?n-subgeneros (+ (length$ $?n-subgeneros) 1) ?nombre))
 	)
 	(bind ?escoger (pregunta-multi "Escoja sus subgeneros de fantasia favoritos: " $?n-subgeneros))
 	(bind $?res (create$ ))
 	(loop-for-count (?i 1 (length$ ?escoger)) do
 		(bind ?ind (nth$ ?i ?escoger))
 		(bind ?gen (nth$ ?ind ?all-sub-fant))
 		(bind $?res (insert$ $?res (+ (length$ $?res) 1) ?gen))
 	)
 	(retract ?hecho)
 	(assert (subgenero-fant-fav TRUE))
 	(modify ?pref (subgeneros-fant-favoritos $res))
)

(defrule recopilacion-prefs::pregunta-subgeneros-cf-fav "Pregunta al usuario"
	?hecho <- (subgenero-cf-fav ask)
	(genero-libro Ciencia_ficcion)
	=>
	(bind ?res (pregunta-si-no "¿Algun subgenero de ciencia ficcion es su favorito?"))
	(retract ?hecho)
	(if (eq ?res TRUE)
		then
		(assert (subgenero-cf-fav elegir))
	else 
		(assert (subgenero-cf-fav FALSE))
	)		
)

(defrule recopilacion-prefs::seleccionar-sub-cf-fav "Establece los generos de ciencia ficcion favorito del usuario"
	?hecho <- (subgenero-cf-fav elegir)
	?pref <- (preferencias)
 	=>
 	(bind $?all-sub-cf (find-all-instances ((?inst Subgenero_ciencia_ficcion)) TRUE))
 	(bind $?n-subgeneros (ceate $ ))
 	(loop-for-count (?i 1 (length$ $?all-sub-cf)) do
 		(bind ?obj (nth$ ?i ?all-sub-cf))
 		(bind ?nombre (send ?obj get-subgenero_ciencia_ficcion))
 		(bind $?n-subgeneros(insert$ $?n-subgeneros (+ (length$ $?n-subgeneros) 1) ?nombre))
 	)
 	(bind ?escoger (pregunta-multi "Escoja sus subgeneros de ciencia ficcion favoritos: " $?n-subgeneros))
 	(bind $?res (create$ ))
 	(loop-for-count (?i 1 (length$ ?escoger)) do
 		(bind ?ind (nth$ ?i ?escoger))
 		(bind ?gen (nth$ ?ind ?all-sub-cf))
 		(bind $?res (insert$ $?res (+ (length$ $?res) 1) ?gen))
 	)
 	(retract ?hecho)
 	(assert (subgenero-cf-fav TRUE))
 	(modify ?pref (subgeneros-cf-favoritos $res))
)

(defrule recopilacion-prefs::pregunta-subgeneros-misterio-fav "Pregunta al usuario"
	?hecho <- (subgenero-mist-fav ask)
	(genero-libro Misterio)
	=>
	(bind ?res (pregunta-si-no "¿Algun subgenero de misterio es su favorito?"))
	(retract ?hecho)
	(if (eq ?res TRUE)
		then
		(assert (subgenero-mist-fav elegir))
	else 
		(assert (subgenero-mist-fav FALSE))
	)		
)

(defrule recopilacion-prefs::seleccionar-sub-mist-fav "Establece los generos de misterio favorito del usuario"
	?hecho <- (subgenero-cmist-fav elegir)
	?pref <- (preferencias)
 	=>
 	(bind $?all-sub-mist (find-all-instances ((?inst Subgenero_misterio)) TRUE))
 	(bind $?n-subgeneros (ceate $ ))
 	(loop-for-count (?i 1 (length$ $?all-sub-mist)) do
 		(bind ?obj (nth$ ?i ?all-sub-mist))
 		(bind ?nombre (send ?obj get-subgenero_misterio))
 		(bind $?n-subgeneros(insert$ $?n-subgeneros (+ (length$ $?n-subgeneros) 1) ?nombre))
 	)
 	(bind ?escoger (pregunta-multi "Escoja sus subgeneros de misterio favoritos: " $?n-subgeneros))
 	(bind $?res (create$ ))
 	(loop-for-count (?i 1 (length$ ?escoger)) do
 		(bind ?ind (nth$ ?i ?escoger))
 		(bind ?gen (nth$ ?ind ?all-sub-mist))
 		(bind $?res (insert$ $?res (+ (length$ $?res) 1) ?gen))
 	)
 	(retract ?hecho)
 	(assert (subgenero-mist-fav TRUE))
 	(modify ?pref (subgeneros-mist-favoritos $res))
)

(defrule recopilacion-prefs::sagas "Establece si le gustan las sagas"
	?hecho <- (saga-libros ask)
	=>
	(bind ?sagas (pregunta-si-no "¿Le gustan las sagas?"))
	(retract ?hecho)
	(if (eq ?sagas TRUE) then
		(assert (saga-libros TRUE))
	else 	
		(assert (saga-libros FALSE))
	)
)

(defrule recopilacion-prefs::lugar "Establece el lugar de lectura de preferencia"
	?hecho <- (transporte-publico ask)
	=>
	(bind ?s (pregunta-si-no "¿Va a leer mientras viaja?"))
	(retract ?hecho)
	(if (eq ?s TRUE) then	
		(assert (transporte-publico TRUE))
	else 
		(assert (transporte-publico FALSE))
	)
)

(defrule recopilacion-prefs::libros-populares "Establece si le gustan los libros populares"
	?hecho <- (libro-best-seller ask)
	=>
	(bind ?populares (pregunta-si-no "¿Le gustan los libros populares?"))
	(retract ?hecho)
	(if (eq ?populares TRUE) then
		(assert (libro-best-seller TRUE))
	else 	
		(assert (libro-best-seller FALSE))
	)
)

(defrule recopilacion-prefs::clasicos-literatura "Establece si le gustan los clasicos de la literatura"
	?hecho <- (clasico-literatura)
	=>
	(bind ?clasicos (pregunta-si-no "¿Le gustan los clasicos de la literatura?"))
	(retract ?hecho)
	(if (eq ?clasicos TRUE) then
		(assert (clasico-literatura TRUE))
	else 
		(assert (clasico-literatura FALSE))
	)
)

(defrule recopilacion-prefs::ciencia-ficcion-hard "Establece si le gustan los libros de ciencia ficcion hard"
	?hecho <- (cf-hard ask)
	=>
	(bind ?cfhard (pregunta-si-no "¿Le gustan los libros de ciencia ficcion hard?"))
	(retract hecho)
	(if (eq ?cfhard TRUE) then
		(asser (cf-hard TRUE))
	else 
		(assert (cf-hard FALSE))
	)
)

(defrule recopilacion-prefs::pasar-a-presentacion "Se pasa al modulo de presentacion"
	=>
	(focus procesado)
)

