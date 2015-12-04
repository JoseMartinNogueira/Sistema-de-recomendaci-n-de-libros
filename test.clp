

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;CLP;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA.CLP;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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

;; Templates
(deftemplate MAIN::Usuario
        (slot nombre (type STRING))
)

(deftemplate MAIN::soluciones-desordenada
        (multislot soluciones (type INSTANCE))
)
(deftemplate MAIN::soluciones-ordenada
        (multislot soluciones (type INSTANCE))
)

;; Fnciones

;; Funcion para encontrar el libro con puntuacion maxima
(deffunction puntuacion-maxima ($?lista)
        (bind ?elem nil)
        (bind ?max -1)
        (progn$ (?rec $?lista)
                (bind ?cont (send ?rec get-libro))
                (bind ?punt (send ?rec get-puntuacion))
                (if (> ?put ?max)
                        then
                        (bind ?max ?punt)
                        (bind ?elem ?rec)
                )
        )
        ?elem
)


;;Mensajes

(defmessage-handler MAIN::Libro plantilla ()
        (format t "Titulo: %s %n" ?self:titulo)
        (format t "Editorial: %s" ?self:editorial)
        (format t "Autor: %s" (send ?self:escrito_por get-autor))
        (format t "Anyo de publicacion: %d" ?self:anyo_publicacion)
        (progn$ (?id-disp (send ?self idioma_disponible))
                (format t "%s" (send ?id-disp get-idioma))
        )
)

(defmessage-handler MAIN::Solucion mostrar ()
        (printout t "+++++++++++++++++++++++++++++++++" crlf)
        ;;(format t "Afinidad: %d %n" ?self:puntuacion)
        (printout t (send ?self:libro plantilla))
        (printout t crlf)
        (printout t "+++++++++++++++++++++++++++++++++" crlf)
)

;; Reglas

;; bienvenida

(defrule MAIN::bienvenida
        (declare (salience 10))
        =>
        (printout t "//////////////////////////////////////////////////")
        (printout t crlf)
        (printout t "  Sistema de recomendacion de libros de ficcion")
        (printout t crlf)
        (printout t "//////////////////////////////////////////////////")
        (printout t crlf)
        (printout t "¡Bienvenido al sistema de recomendacion de libros de ficcion!")
        (printout t crlf)
        (printout t "A continuacion le formularemos una serie de preguntas")
        (printout t crlf)       
)

;; Generacion soluciones

(defrule generador::lista-soluciones
        (not (soluciones-desordenada))
        =>
        (assert (soluciones-desordenada))
)

(defrule generador::add-solucion 
        (declare (salience 10))
        ?sol <- (object (is-a Solucion))
        ?aux <- (soluciones-desordenada (soluciones $?lista))
        (test (not (member$ ?rec $?lista)))
        =>
        (bind $?lista (insert$ $?lista (+ (length $ $?lista) 1) ?sol))
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
        (not (final))
        =>
        (printout t "Estos son los 3 libros que le recomendamos" crlf)
        (printout t crlf)
        (printout t (send (nth 0 ?soluciones) mostrar))
        (printout t (send (nth 1 ?soluciones) mostrar))
        (printout t (send (nth 2 ?soluciones) mostrar)) 
        (assert (final))
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PREFERENCIAS.CLP;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PROCESADO.CLP;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



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

