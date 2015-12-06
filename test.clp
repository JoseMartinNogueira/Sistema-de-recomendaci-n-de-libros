

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;CLP;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA.CLP;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;protege


;;ontologia

; Tue Dec 01 08:43:28 CET 2015
; 
;+ (version "3.4.1")
;+ (build "Build 537")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
        (is-a USER)
        (role abstract)
        (single-slot hard
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot edicion_bolsillo
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot edad_recomendada
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_ciencia_ficcion
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot clasico_literatura
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot titulo
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot num_pag
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot Nombre
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_romance
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_sugnerero_rom
                (type INSTANCE)
;+              (allowed-classes)
;+              (inverse-slot sugnerero_rom)
                (create-accessor read-write))
        (multislot idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Idioma)
                (cardinality 1 ?VARIABLE)
;+              (inverse-slot inverse_of_idioma_disponible)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_cf
                (type INSTANCE)
;+              (allowed-classes Ciencia_ficcion)
;+              (inverse-slot subgenero_cf)
                (create-accessor read-write))
        (single-slot subgenero_cf
                (type INSTANCE)
;+              (allowed-classes Subgenero_ciencia_ficcion)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_subgenero_cf)
                (create-accessor read-write))
        (multislot inverse_of_idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Libro)
;+              (inverse-slot idioma_disponible)
                (create-accessor read-write))
        (single-slot idioma
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Subgenero_misterio)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_subgenero_mist)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Misterio)
;+              (inverse-slot subgenero_mist)
                (create-accessor read-write))
        (multislot inverse_of_escrito_por
                (type INSTANCE)
;+              (allowed-classes Libro)
;+              (inverse-slot escrito_por)
                (create-accessor read-write))
        (single-slot saga
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Subgenero_fantasia)
;+              (cardinality 0 1)
;+              (inverse-slot inverse_of_subgenero_fant)
                (create-accessor read-write))
        (single-slot sugnerero_rom
                (type INSTANCE)
;+              (allowed-classes)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_sugnerero_rom)
                (create-accessor read-write))
        (single-slot best_seller
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_misterio
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot editorial
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Fantasia)
;+              (inverse-slot subgenero_fant)
                (create-accessor read-write))
        (single-slot escrito_por
                (type INSTANCE)
;+              (allowed-classes Autor)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_escrito_por)
                (create-accessor read-write))
        (single-slot Nacionalidad
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_fantasia
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot anyo_publicacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Libro
        (is-a USER)
        (role concrete)
        (single-slot escrito_por
                (type INSTANCE)
;+              (allowed-classes Autor)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot saga
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot titulo
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot best_seller
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot num_pag
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot edicion_bolsillo
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot edad_recomendada
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Idioma)
                (cardinality 1 ?VARIABLE)
                (create-accessor read-write))
        (single-slot clasico_literatura
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot editorial
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot anyo_publicacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Fantasia
        (is-a Libro)
        (role concrete)
        (single-slot subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Subgenero_fantasia)
;+              (cardinality 0 1)
                (create-accessor read-write)))

(defclass Ciencia_ficcion
        (is-a Libro)
        (role concrete)
        (single-slot hard
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_cf
                (type INSTANCE)
;+              (allowed-classes Subgenero_ciencia_ficcion)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Misterio
        (is-a Libro)
        (role concrete)
        (single-slot subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Subgenero_misterio)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Idioma
        (is-a USER)
        (role concrete)
        (multislot inverse_of_idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Libro)
                (create-accessor read-write))
        (single-slot idioma
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Autor
        (is-a USER)
        (role concrete)
        (single-slot Nacionalidad
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot Nombre
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_escrito_por
                (type INSTANCE)
;+              (allowed-classes Libro)
                (create-accessor read-write)))

(defclass Subgenero_fantasia
        (is-a USER)
        (role concrete)
        (single-slot subgenero_fantasia
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Fantasia)
                (create-accessor read-write)))

(defclass Subgenero_ciencia_ficcion
        (is-a USER)
        (role concrete)
        (single-slot subgenero_ciencia_ficcion
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_cf
                (type INSTANCE)
;+              (allowed-classes Ciencia_ficcion)
                (create-accessor read-write)))

(defclass Subgenero_misterio
        (is-a USER)
        (role concrete)
        (multislot inverse_of_subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Misterio)
                (create-accessor read-write))
        (single-slot subgenero_misterio
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write)))

;;Instancias

; Tue Dec 01 08:43:28 CET 2015
; 
;+ (version "3.4.1")
;+ (build "Build 537")
(definstances instances
([SBCFinal_Class0] of  Idioma

        (idioma "espanol")
        (inverse_of_idioma_disponible
                [SBCFinal_Class24]
                [SBCFinal_Class25]))

([SBCFinal_Class1] of  Idioma

        (idioma "catalan")
        (inverse_of_idioma_disponible [SBCFinal_Class24]))

([SBCFinal_Class10] of  Subgenero_ciencia_ficcion

        (subgenero_ciencia_ficcion "viajes_en_el_tiempo"))

([SBCFinal_Class11] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf [SBCFinal_Class24])
        (subgenero_ciencia_ficcion "espacio"))

([SBCFinal_Class12] of  Subgenero_ciencia_ficcion

        (subgenero_ciencia_ficcion "robotica_y_inteligencia_artificial"))

([SBCFinal_Class13] of  Subgenero_ciencia_ficcion

        (subgenero_ciencia_ficcion "socal_alternativo"))

([SBCFinal_Class14] of  Subgenero_ciencia_ficcion

        (subgenero_ciencia_ficcion "social_utopia"))

([SBCFinal_Class15] of  Subgenero_ciencia_ficcion

        (subgenero_ciencia_ficcion "social_distopia"))

([SBCFinal_Class16] of  Subgenero_misterio

        (inverse_of_subgenero_mist [SBCFinal_Class26])
        (subgenero_misterio "policial"))

([SBCFinal_Class17] of  Subgenero_misterio

        (subgenero_misterio "suspense"))

([SBCFinal_Class19] of  Autor

        (inverse_of_escrito_por [SBCFinal_Class24])
        (Nacionalidad "nac1")
        (Nombre "autor1"))

([SBCFinal_Class2] of  Idioma

        (idioma "ingles")
        (inverse_of_idioma_disponible
                [SBCFinal_Class24]
                [SBCFinal_Class26]))

([SBCFinal_Class20] of  Autor

        (inverse_of_escrito_por [SBCFinal_Class25])
        (Nacionalidad "nac2")
        (Nombre "autor2"))

([SBCFinal_Class21] of  Autor

        (inverse_of_escrito_por [SBCFinal_Class26])
        (Nacionalidad "nac2")
        (Nombre "autor3"))

([SBCFinal_Class22] of  Autor

        (Nacionalidad "nac3")
        (Nombre "autor4"))

([SBCFinal_Class23] of  Autor

        (Nacionalidad "nac2")
        (Nombre "autor5"))

([SBCFinal_Class24] of  Ciencia_ficcion

        (anyo_publicacion 1900)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo TRUE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class19])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1]
                [SBCFinal_Class2])
        (num_pag 500)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class11])
        (titulo "libro1"))

([SBCFinal_Class25] of  Fantasia

        (anyo_publicacion 2000)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 12)
        (edicion_bolsillo TRUE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class20])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 300)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class5])
        (titulo "libro2"))

([SBCFinal_Class26] of  Misterio

        (anyo_publicacion 1500)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 18)
        (edicion_bolsillo TRUE)
        (editorial "edit2")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 150)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class16])
        (titulo "libro3"))

([SBCFinal_Class3] of  Idioma

        (idioma "aleman"))

([SBCFinal_Class4] of  Idioma

        (idioma "chino"))

([SBCFinal_Class5] of  Subgenero_fantasia

        (inverse_of_subgenero_fant [SBCFinal_Class25])
        (subgenero_fantasia "cuentos_clasicos"))

([SBCFinal_Class6] of  Subgenero_fantasia

        (subgenero_fantasia "magia_y_espada"))

([SBCFinal_Class7] of  Subgenero_fantasia

        (subgenero_fantasia "alta_fantasia"))

([SBCFinal_Class8] of  Subgenero_fantasia

        (subgenero_fantasia "medieval"))

([SBCFinal_Class9] of  Subgenero_fantasia

        (subgenero_fantasia "terror"))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;,

(defclass Solucion
        (is-a USER)
        (role concrete)
        (slot libro
                (type INSTANCE)
                (create-accessor read-write))
        (slot puntuacion
                (type INTEGER)
                (create-accessor read-write))
)

;;; Modulos
(defmodule MAIN(export ?ALL))

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

;;; Modulo de filtrado y procesado del contenido adequado al usuario
(defmodule procesado
        (import MAIN ?ALL)
        (import recopilacion-usuario deftemplate ?ALL)
        (import recopilacion-prefs deftemplate ?ALL)
        (export ?ALL)
)


;;;Modulo generacion de soluciones
(defmodule generador
        (import MAIN ?ALL)
        (export ?ALL)
)

;;; Modulo de representacion de soluciones
(defmodule representacion
        (import MAIN ?ALL)
        (export ?ALL)
)


;;Mensajes

(defmessage-handler MAIN::Libro imprimir ()
        (format t "Titulo: %s %n" ?self:titulo)
        (format t "Editorial: %s" ?self:editorial)
        (format t "Autor: %s" (send ?self:escrito_por get-autor))
        (format t "Anyo de publicacion: %d" ?self:anyo_publicacion)
        (progn$ (?id-disp (send ?self idioma_disponible))
                (format t "%s" (send ?id-disp get-idioma))
        )
)

(defmessage-handler MAIN::Solucion imprimir ()
        (printout t "+++++++++++++++++++++++++++++++++" crlf)
        (format t "Afinidad: %d %n" ?self:puntuacion)
        (printout t (send ?self:libro imprimir))
        (printout t crlf)
        (printout t "+++++++++++++++++++++++++++++++++" crlf)
)

;; Templates

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


;;; Template para una lista de recomendaciones sin orden
(deftemplate MAIN::soluciones-desordenada
        (multislot soluciones (type INSTANCE))
)

;;; Template para una lista de recomendaciones con orden
(deftemplate MAIN::soluciones-ordenada
        (multislot soluciones (type INSTANCE))
)



;; Funcion para encontrar el libro con puntuacion maxima
(deffunction puntuacion-maxima ($?lista)
        (bind ?elem nil)
        (bind ?max -1)
        (progn$ (?rec $?lista)
                (bind ?cont (send ?rec get-libro))
                (bind ?punt (send ?rec get-puntuacion))
                (if (> ?punt ?max)
                        then
                        (bind ?max ?punt)
                        (bind ?elem ?rec)
                )
        )
        ?elem
)


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

;; Reglas

;; bienvenida

(defrule MAIN::bienvenida
        (declare (salience 10))
        =>
        (printout t "//////////////////////////////////////////////////" crlf)
        (printout t crlf)
        (printout t "  Sistema de recomendacion de libros" crlf)
        (printout t crlf)
        (printout t "//////////////////////////////////////////////////" crlf)
        (printout t crlf)
        (printout t "¡Bienvenido al sistema de recomendacion de libros!")
        (printout t crlf)
        (printout t "A continuacion le formularemos una serie de preguntas")
        (printout t crlf)
        (focus recopilacion-usuario)       
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PREFERENCIAS.CLP;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Declaracion de templates --------------------------

;;; Declaracion de funciones --------------------------


;;; Modulo recopilacion

(defrule recopilacion-usuario::establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
        (not (Usuario))
        =>
        (bind ?nombre (pregunta-general "¿Cómo te llamas? "))
        (assert (Usuario (nombre ?nombre)))
)


(defrule recopilacion-usuario::establecer-edad "Establece la edad del usuario"
        ?u <- (Usuario (edad ?edad))
        (test (< ?edad 0))
        =>
        (bind ?e (pregunta-numerica "¿Qué edad tienes? " 1 110))
        (modify ?u (edad ?e))
)

(defrule recopilacion-usuario::pasar-a-preferencias "Pasa a la recopilacion de preferencias"
        (declare (salience 10))
        ?u <- (Usuario (edad ?e))
        (test (> ?e 0))
        =>
        (focus recopilacion-prefs)
)

(defrule recopilacion-prefs::hechos-iniciales "Establece hechos para poder recopilar informacion"
        =>
        (assert (generos-libros ask))
        (assert (subgenero-fant-fav ask))
        (assert (subgenero-cf-fav ask))
        (assert (subgenero-mist-fav ask))
        (assert (saga-libros ask))
        (assert (transporte-publico ask))
        (assert (libro-best-seller ask))
        (assert (preferencias ))
)
(defrule recopilacion-prefs::preguntar-generos "Establece los generos que le gustaira leer al lector"
        ?generos-libros <- (generos-libros ask)
        =>
        (bind ?genlib (create$ "Fantasia" "Ciencia ficcion" "Misterio"))
        (bind ?respuesta (pregunta-multi "¿Que genero(s) le gustaria leer? (Fantasia/Ciencia ficcion/Misterio)" ?genlib))
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
        (retract ?generos-libros)
        (assert (generos-libros TRUE))
)

(defrule recopilacion-prefs::relacionado-ciencia-ficcion "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-libro Ciencia_ficcion))
        =>
        (assert (subgenero-cf-fav FALSE))
        (assert (cf-hard FALSE))
)

(defrule recopilacion-prefs::relacionado-misterio "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-libro Misterio))
        =>
        (assert (subgenero-mist-fav FALSE))
)

(defrule recopilacion-prefs::relacionado-fantasia "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-libro Fantasia))
        =>
        (assert (subgenero-fant-fav FALSE))
)

(defrule recopilacion-prefs::pregunta-subgeneros-fant-favoritos "Pregunta al usuario"
        ?hecho <- (subgenero-fant-fav ask)
        (genero-libro Fantasia)
        =>
        (bind ?res (pregunta-si-no "¿Algun subgenero de fantasia es tu favorito?"))
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
        (bind $?n-subgeneros (create$ ))
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
        (modify ?pref (subgeneros-fant-favoritos $?res))
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
        (bind $?n-subgeneros (create$ ))
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
        (modify ?pref (subgeneros-cf-favoritos $?res))
)

(defrule recopilacion-prefs::pregunta-subgeneros-mist-fav "Pregunta al usuario"
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
        (bind $?n-subgeneros (create$ ))
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
        (modify ?pref (subgeneros-mist-favoritos $?res))
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
                (assert (cf-hard TRUE))
        else 
                (assert (cf-hard FALSE))
        )
)

(defrule recopilacion-prefs::pasar-a-procesado "Se pasa al modulo de procesado"
        (declare (salience -1))
        ?h1 <- (subgenero-fant-fav TRUE|FALSE)
        ?h3 <- (subgenero-cf-fav TRUE|FALSE)
        ?h5 <- (subgenero-mist-fav TRUE|FALSE)
        ?h6 <- (saga-libros TRUE|FALSE)
        ?h7 <- (transporte-publico TRUE|FALSE)
        ?h9 <- (libro-best-seller TRUE|FALSE)
        ?h11 <- (cf-hard TRUE|FALSE)
        =>
        (focus procesado)
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PROCESADO.CLP;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
        ?hecho <- (subgenero-fant-fav ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-fant-fav ?curr-gen))
                )
        )
)

(defrule procesado::aux-subgenero-mist "Crea hechos para poder procesar los subgeneros favoritos"
        (preferencias (subgeneros-mist-favoritos $?gen))
        ?hecho <- (subgenero-mist-fav ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-mist-fav ?curr-gen))
                )
        )
)


(defrule procesado::aux-subgenero-fant "Crea hechos para poder procesar los subgeneros favoritos"
        (preferencias (subgeneros-fant-favoritos $?gen))
        ?hecho <- (subgenero-fant-fav ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-fant-fav ?curr-gen))
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
        ?hecho <- (subgenero-cf-fav ?gen)
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf ?generos))
        (test (eq ?gen ?generos))
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
        ?hecho <- (subgenero-fant-fav ?gen)
        ?cont <-(object (is-a Fantasia) (subgenero_fant ?generos))
        (test (eq ?gen ?generos))
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
        ?hecho <- (subgenero-mist-fav ?gen)
        ?cont <-(object (is-a Misterio) (subgenero_mist ?generos))
        (test (eq ?gen ?generos))
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

(defrule procesado::descartar-clasicos-literatura "Descarta los clasicos de la literatura"
        (declare (salience 10))
        (clasico-literatura FALSE)
        ?cont <- (object (is-a Libro) (clasico_literatura FALSE))
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
        (libro-edicion-bolsillo TRUE)
        ?cont <- (object (is-a Libro) (edicion_bolsillo TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (edicion-bolsillo-valorado ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (assert (edicion-bolsillo-valorado ?cont))
)

(defrule procesado::valorar-clasico-literatura "Mejora la puntuacion de los clasicos de la literatura"
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

(defrule procesado::pasar-a-generacion "Pasa al modulo de generacion de respuestas"
        (declare(salience -10))
        =>
        (printout t "Generando respuesta..." crlf)
        (focus generador)
)





;;;;;;;;;Generacion soluciones
;; 

(defrule generador::lista-soluciones
        (not (soluciones-desordenada))
        =>
        (assert (soluciones-desordenada))
)

(defrule generador::add-solucion 
        (declare (salience 10))
        ?sol <- (object (is-a Solucion))
        ?aux <- (soluciones-desordenada (soluciones $?lista))
        (test (not (member$ ?sol $?lista)))
        =>
        (bind $?lista (insert$ $?lista (+ (length$ $?lista) 1) ?sol))
        (modify ?aux (soluciones $?lista))
)

(defrule generador::ordenar-lista
        (not (soluciones-ordenada))
        (soluciones-desordenada (soluciones $?lista))
        =>
        (bind $?ordenada (create$ ))
        (while (and (not (eq (length$ $?lista) 0)) (< (length$ $?ordenada) 3)) do 
                (bind ?sol (puntuacion-maxima $?lista))
                (bind $?lista (delete-member$ $?lista ?sol))
                (bind $?ordenada (insert$ $?ordenada (+ (length$ $?ordenada) 1) ?sol))
        )
        (assert (soluciones-ordenada (soluciones $?ordenada)))
)

(defrule generador::enviar-presentacion
        (soluciones-ordenada)
        =>
        (focus representacion)
)

;; Representacion

(defrule representacion::solucion-final
        (soluciones-ordenada (soluciones $?soluciones))
        (Usuario (nombre ?nombre))
        (not (final))
        =>
        (printout t "Estos son los 3 libros que le recomendamos" crlf)
        (printout t crlf)
        (printout t (send (nth 0 ?soluciones) imprimir))
        ;(printout t (send (nth 1 ?soluciones) imprimir))
        ;(printout t (send (nth 2 ?soluciones) imprimir)) 
        (assert (final))
)
