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
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edicion_bolsillo
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad_recomendada
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_ciencia_ficcion
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot clasico_literatura
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot num_pag
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_romance
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_sugnerero_rom
		(type INSTANCE)
;+		(allowed-classes)
;+		(inverse-slot sugnerero_rom)
		(create-accessor read-write))
	(multislot idioma_disponible
		(type INSTANCE)
;+		(allowed-classes Idioma)
		(cardinality 1 ?VARIABLE)
;+		(inverse-slot inverse_of_idioma_disponible)
		(create-accessor read-write))
	(multislot inverse_of_subgenero_cf
		(type INSTANCE)
;+		(allowed-classes Ciencia_ficcion)
;+		(inverse-slot subgenero_cf)
		(create-accessor read-write))
	(single-slot subgenero_cf
		(type INSTANCE)
;+		(allowed-classes Subgenero_ciencia_ficcion)
;+		(cardinality 1 1)
;+		(inverse-slot inverse_of_subgenero_cf)
		(create-accessor read-write))
	(multislot inverse_of_idioma_disponible
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot idioma_disponible)
		(create-accessor read-write))
	(single-slot idioma
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_mist
		(type INSTANCE)
;+		(allowed-classes Subgenero_misterio)
;+		(cardinality 1 1)
;+		(inverse-slot inverse_of_subgenero_mist)
		(create-accessor read-write))
	(multislot inverse_of_subgenero_mist
		(type INSTANCE)
;+		(allowed-classes Misterio)
;+		(inverse-slot subgenero_mist)
		(create-accessor read-write))
	(multislot inverse_of_escrito_por
		(type INSTANCE)
;+		(allowed-classes Libro)
;+		(inverse-slot escrito_por)
		(create-accessor read-write))
	(single-slot saga
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_fant
		(type INSTANCE)
;+		(allowed-classes Subgenero_fantasia)
;+		(cardinality 0 1)
;+		(inverse-slot inverse_of_subgenero_fant)
		(create-accessor read-write))
	(single-slot sugnerero_rom
		(type INSTANCE)
;+		(allowed-classes)
;+		(cardinality 1 1)
;+		(inverse-slot inverse_of_sugnerero_rom)
		(create-accessor read-write))
	(single-slot best_seller
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_misterio
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot editorial
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_subgenero_fant
		(type INSTANCE)
;+		(allowed-classes Fantasia)
;+		(inverse-slot subgenero_fant)
		(create-accessor read-write))
	(single-slot escrito_por
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
;+		(inverse-slot inverse_of_escrito_por)
		(create-accessor read-write))
	(single-slot Nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_fantasia
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot anyo_publicacion
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Libro
	(is-a USER)
	(role concrete)
	(single-slot escrito_por
		(type INSTANCE)
;+		(allowed-classes Autor)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot saga
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot titulo
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot best_seller
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot num_pag
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edicion_bolsillo
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot edad_recomendada
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot idioma_disponible
		(type INSTANCE)
;+		(allowed-classes Idioma)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write))
	(single-slot clasico_literatura
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot editorial
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot anyo_publicacion
		(type INTEGER)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Fantasia
	(is-a Libro)
	(role concrete)
	(single-slot subgenero_fant
		(type INSTANCE)
;+		(allowed-classes Subgenero_fantasia)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Ciencia_ficcion
	(is-a Libro)
	(role concrete)
	(single-slot hard
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot subgenero_cf
		(type INSTANCE)
;+		(allowed-classes Subgenero_ciencia_ficcion)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Misterio
	(is-a Libro)
	(role concrete)
	(single-slot subgenero_mist
		(type INSTANCE)
;+		(allowed-classes Subgenero_misterio)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Idioma
	(is-a USER)
	(role concrete)
	(multislot inverse_of_idioma_disponible
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write))
	(single-slot idioma
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Autor
	(is-a USER)
	(role concrete)
	(single-slot Nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_escrito_por
		(type INSTANCE)
;+		(allowed-classes Libro)
		(create-accessor read-write)))

(defclass Subgenero_fantasia
	(is-a USER)
	(role concrete)
	(single-slot subgenero_fantasia
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_subgenero_fant
		(type INSTANCE)
;+		(allowed-classes Fantasia)
		(create-accessor read-write)))

(defclass Subgenero_ciencia_ficcion
	(is-a USER)
	(role concrete)
	(single-slot subgenero_ciencia_ficcion
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write))
	(multislot inverse_of_subgenero_cf
		(type INSTANCE)
;+		(allowed-classes Ciencia_ficcion)
		(create-accessor read-write)))

(defclass Subgenero_misterio
	(is-a USER)
	(role concrete)
	(multislot inverse_of_subgenero_mist
		(type INSTANCE)
;+		(allowed-classes Misterio)
		(create-accessor read-write))
	(single-slot subgenero_misterio
		(type STRING)
;+		(cardinality 1 1)
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
(deffunction puntuacion-maxima ($lista)
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
