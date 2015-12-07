

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;CLP;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;PRACTICA.CLP;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;protege


;;ontologia
; Mon Dec 07 02:23:35 CET 2015
; 
;+ (version "3.4.1")
;+ (build "Build 537")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
        (is-a USER)
        (role abstract)
        (single-slot idioma
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Libro)
;+              (inverse-slot idioma_disponible)
                (create-accessor read-write))
        (single-slot subgenero_misterio
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_fantasia
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot Nombre
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Subgenero_fantasia)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_subgenero_fant)
                (create-accessor read-write))
        (single-slot subgenero_romance
                (type STRING)
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
        (single-slot puntuacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot titulo
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_rom
                (type INSTANCE)
;+              (allowed-classes)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_sugnerero_rom)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Fantasia)
;+              (inverse-slot subgenero_fant)
                (create-accessor read-write))
        (single-slot saga
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot escrito_por
                (type INSTANCE)
;+              (allowed-classes Autor)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_escrito_por)
                (create-accessor read-write))
        (single-slot hard
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_sugnerero_rom
                (type INSTANCE)
;+              (allowed-classes)
;+              (inverse-slot subgenero_rom)
                (create-accessor read-write))
        (single-slot clasico_literatura
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot subgenero_ciencia_ficcion
                (type STRING)
;+              (cardinality 1 1)
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
        (single-slot editorial
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Misterio)
;+              (inverse-slot subgenero_mist)
                (create-accessor read-write))
        (single-slot subgenero_mist
                (type INSTANCE)
;+              (allowed-classes Subgenero_misterio)
;+              (cardinality 1 1)
;+              (inverse-slot inverse_of_subgenero_mist)
                (create-accessor read-write))
        (single-slot num_pag
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot anyo_publicacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot Nacionalidad
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_escrito_por
                (type INSTANCE)
;+              (allowed-classes Libro)
;+              (inverse-slot escrito_por)
                (create-accessor read-write))
        (multislot idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Idioma)
                (cardinality 1 ?VARIABLE)
;+              (inverse-slot inverse_of_idioma_disponible)
                (create-accessor read-write))
        (single-slot best_seller
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Libro
        (is-a USER)
        (role concrete)
        (single-slot edad_recomendada
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot num_pag
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot clasico_literatura
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot anyo_publicacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot puntuacion
                (type INTEGER)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot titulo
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot editorial
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Idioma)
                (cardinality 1 ?VARIABLE)
                (create-accessor read-write))
        (single-slot best_seller
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot saga
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot edicion_bolsillo
                (type SYMBOL)
                (allowed-values FALSE TRUE)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot escrito_por
                (type INSTANCE)
;+              (allowed-classes Autor)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Fantasia
        (is-a Libro)
        (role concrete)
        (single-slot subgenero_fant
                (type INSTANCE)
;+              (allowed-classes Subgenero_fantasia)
;+              (cardinality 1 1)
                (create-accessor read-write)))

(defclass Ciencia_ficcion
        (is-a Libro)
        (role concrete)
        (single-slot subgenero_cf
                (type INSTANCE)
;+              (allowed-classes Subgenero_ciencia_ficcion)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot hard
                (type SYMBOL)
                (allowed-values FALSE TRUE)
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
        (single-slot idioma
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (multislot inverse_of_idioma_disponible
                (type INSTANCE)
;+              (allowed-classes Libro)
                (create-accessor read-write)))

(defclass Autor
        (is-a USER)
        (role concrete)
        (multislot inverse_of_escrito_por
                (type INSTANCE)
;+              (allowed-classes Libro)
                (create-accessor read-write))
        (single-slot Nombre
                (type STRING)
;+              (cardinality 1 1)
                (create-accessor read-write))
        (single-slot Nacionalidad
                (type STRING)
;+              (cardinality 1 1)
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

(definstances instances
; Mon Dec 07 23:17:56 CET 2015
; 
;+ (version "3.4.1")
;+ (build "Build 537")

([SBCFinal_Class0] of  Idioma

        (idioma "espanol")
        (inverse_of_idioma_disponible
                [SBCFinal_Class24]
                [SBCFinal_Class25]
                [SBCFinal_Class10001]
                [SBCFinal_Class10002]
                [SBCFinal_Class10007]
                [SBCFinal_Class10009]
                [SBCFinal_Class10011]
                [SBCFinal_Class10014]
                [SBCFinal_Class20001]
                [SBCFinal_Class20002]
                [SBCFinal_Class20003]
                [SBCFinal_Class20004]
                [SBCFinal_Class20005]
                [SBCFinal_Class20006]
                [SBCFinal_Class20009]
                [SBCFinal_Class20010]
                [SBCFinal_Class20013]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20019]
                [SBCFinal_Class20020]
                [SBCFinal_Class20021]
                [SBCFinal_Class20022]
                [SBCFinal_Class20024]
                [SBCFinal_Class20026]
                [SBCFinal_Class20027]
                [SBCFinal_Class20028]
                [SBCFinal_Class20030]
                [SBCFinal_Class20031]
                [SBCFinal_Class20033]))

([SBCFinal_Class1] of  Idioma

        (idioma "catalan")
        (inverse_of_idioma_disponible
                [SBCFinal_Class24]
                [SBCFinal_Class10000]
                [SBCFinal_Class10003]
                [SBCFinal_Class10005]
                [SBCFinal_Class10015]
                [SBCFinal_Class20006]
                [SBCFinal_Class20007]
                [SBCFinal_Class20009]
                [SBCFinal_Class20010]
                [SBCFinal_Class20012]
                [SBCFinal_Class20014]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20019]
                [SBCFinal_Class20018]
                [SBCFinal_Class20020]
                [SBCFinal_Class20022]
                [SBCFinal_Class20023]
                [SBCFinal_Class20026]
                [SBCFinal_Class20029]
                [SBCFinal_Class20031]))

([SBCFinal_Class10] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class10003]
                [SBCFinal_Class10004]
                [SBCFinal_Class20002]
                [SBCFinal_Class20005])
        (subgenero_ciencia_ficcion "viajes_en_el_tiempo"))

([SBCFinal_Class10000] of  Ciencia_ficcion

        (anyo_publicacion 1950)
        (best_seller FALSE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edit2")
        (escrito_por [SBCFinal_Class20])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class3]
                [SBCFinal_Class1]
                [SBCFinal_Class4])
        (num_pag 200)
        (puntuacion 10)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class11])
        (titulo "lib4"))

([SBCFinal_Class10001] of  Ciencia_ficcion

        (anyo_publicacion 1941)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 40)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class22])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class4]
                [SBCFinal_Class0]
                [SBCFinal_Class2])
        (num_pag 1000)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class12])
        (titulo "lib5"))

([SBCFinal_Class10002] of  Ciencia_ficcion

        (anyo_publicacion 1945)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 2)
        (edicion_bolsillo FALSE)
        (editorial "edit5")
        (escrito_por [SBCFinal_Class23])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class4]
                [SBCFinal_Class0])
        (num_pag 500)
        (puntuacion 15)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class14])
        (titulo "lib6"))

([SBCFinal_Class10003] of  Ciencia_ficcion

        (anyo_publicacion 1980)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 2)
        (edicion_bolsillo FALSE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class22])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class3]
                [SBCFinal_Class1])
        (num_pag 100)
        (puntuacion 23)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class10])
        (titulo "lib7"))

([SBCFinal_Class10004] of  Ciencia_ficcion

        (anyo_publicacion 1999)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit2")
        (escrito_por [SBCFinal_Class21])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class4])
        (num_pag 150)
        (puntuacion 7)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class10])
        (titulo "lib8"))

([SBCFinal_Class10005] of  Ciencia_ficcion

        (anyo_publicacion 1921)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class22])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class1])
        (num_pag 40)
        (puntuacion 3)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class13])
        (titulo "lib9"))

([SBCFinal_Class10006] of  Ciencia_ficcion

        (anyo_publicacion 1944)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 13)
        (edicion_bolsillo FALSE)
        (editorial "edit2")
        (escrito_por [SBCFinal_Class23])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class4])
        (num_pag 200)
        (puntuacion 11)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class15])
        (titulo "lib10"))

([SBCFinal_Class10007] of  Fantasia

        (anyo_publicacion 1910)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 2)
        (edicion_bolsillo FALSE)
        (editorial "edit11")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 45)
        (puntuacion 54)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class7])
        (titulo "lib11"))

([SBCFinal_Class10008] of  Fantasia

        (anyo_publicacion 1933)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 12)
        (edicion_bolsillo TRUE)
        (editorial "edit9")
        (escrito_por [SBCFinal_Class19])
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 400)
        (puntuacion 1)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class6])
        (titulo "lib12"))

([SBCFinal_Class10009] of  Fantasia

        (anyo_publicacion 1888)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 40)
        (puntuacion 43)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class8])
        (titulo "lib13"))

([SBCFinal_Class10010] of  Fantasia

        (anyo_publicacion 1920)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 18)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible [SBCFinal_Class3])
        (num_pag 600)
        (puntuacion 55)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class9])
        (titulo "lib14"))

([SBCFinal_Class10011] of  Misterio

        (anyo_publicacion 1539)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 22)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 400)
        (puntuacion 23)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class17])
        (titulo "lib15"))

([SBCFinal_Class10012] of  Misterio

        (anyo_publicacion 1984)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 3)
        (edicion_bolsillo TRUE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class20])
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 100)
        (puntuacion 15)
        (saga FALSE)
        (subgenero_mist [SBCFinal_Class16])
        (titulo "lib16"))

([SBCFinal_Class10013] of  Misterio

        (anyo_publicacion 1967)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 5)
        (edicion_bolsillo FALSE)
        (editorial "edit8")
        (escrito_por [SBCFinal_Class23])
        (idioma_disponible [SBCFinal_Class3])
        (num_pag 200)
        (puntuacion 21)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class17])
        (titulo "lib17"))

([SBCFinal_Class10014] of  Fantasia

        (anyo_publicacion 1954)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 7)
        (edicion_bolsillo FALSE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 250)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class7])
        (titulo "lib18"))

([SBCFinal_Class10015] of  Fantasia

        (anyo_publicacion 1967)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 4)
        (edicion_bolsillo TRUE)
        (editorial "edit7")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible [SBCFinal_Class1])
        (num_pag 150)
        (puntuacion 26)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class5])
        (titulo "lib19"))

([SBCFinal_Class11] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class24]
                [SBCFinal_Class10000]
                [SBCFinal_Class20000]
                [SBCFinal_Class20001])
        (subgenero_ciencia_ficcion "espacio"))

([SBCFinal_Class12] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class10001]
                [SBCFinal_Class20003]
                [SBCFinal_Class20004]
                [SBCFinal_Class20006])
        (subgenero_ciencia_ficcion "robotica_y_inteligencia_artificial"))

([SBCFinal_Class13] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class10005]
                [SBCFinal_Class20013]
                [SBCFinal_Class20014]
                [SBCFinal_Class20015])
        (subgenero_ciencia_ficcion "socal_alternativo"))

([SBCFinal_Class14] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class10002]
                [SBCFinal_Class20010]
                [SBCFinal_Class20011]
                [SBCFinal_Class20012])
        (subgenero_ciencia_ficcion "social_utopia"))

([SBCFinal_Class15] of  Subgenero_ciencia_ficcion

        (inverse_of_subgenero_cf
                [SBCFinal_Class10006]
                [SBCFinal_Class20007]
                [SBCFinal_Class20008]
                [SBCFinal_Class20009])
        (subgenero_ciencia_ficcion "social_distopia"))

([SBCFinal_Class16] of  Subgenero_misterio

        (inverse_of_subgenero_mist
                [SBCFinal_Class26]
                [SBCFinal_Class10012]
                [SBCFinal_Class20030]
                [SBCFinal_Class20031])
        (subgenero_misterio "policial"))

([SBCFinal_Class17] of  Subgenero_misterio

        (inverse_of_subgenero_mist
                [SBCFinal_Class10011]
                [SBCFinal_Class10013]
                [SBCFinal_Class20032]
                [SBCFinal_Class20033])
        (subgenero_misterio "suspense"))

([SBCFinal_Class19] of  Autor

        (inverse_of_escrito_por
                [SBCFinal_Class24]
                [SBCFinal_Class10008]
                [SBCFinal_Class20005]
                [SBCFinal_Class20009]
                [SBCFinal_Class20010]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20024]
                [SBCFinal_Class20027]
                [SBCFinal_Class20031])
        (Nacionalidad "nac1")
        (Nombre "autor1"))

([SBCFinal_Class2] of  Idioma

        (idioma "ingles")
        (inverse_of_idioma_disponible
                [SBCFinal_Class24]
                [SBCFinal_Class26]
                [SBCFinal_Class10001]
                [SBCFinal_Class10008]
                [SBCFinal_Class10012]
                [SBCFinal_Class20000]
                [SBCFinal_Class20008]
                [SBCFinal_Class20009]
                [SBCFinal_Class20014]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20020]
                [SBCFinal_Class20021]
                [SBCFinal_Class20024]
                [SBCFinal_Class20025]
                [SBCFinal_Class20026]
                [SBCFinal_Class20027]
                [SBCFinal_Class20028]
                [SBCFinal_Class20030]
                [SBCFinal_Class20032]))

([SBCFinal_Class20] of  Autor

        (inverse_of_escrito_por
                [SBCFinal_Class25]
                [SBCFinal_Class10000]
                [SBCFinal_Class10012]
                [SBCFinal_Class20002]
                [SBCFinal_Class20008]
                [SBCFinal_Class20019]
                [SBCFinal_Class20023]
                [SBCFinal_Class20029])
        (Nacionalidad "nac2")
        (Nombre "autor2"))

([SBCFinal_Class20000] of  Ciencia_ficcion

        (anyo_publicacion 1994)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit3")
        (escrito_por [SBCFinal_Class23])
        (hard FALSE)
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 600)
        (puntuacion 50)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class11])
        (titulo "lib20"))

([SBCFinal_Class20001] of  Ciencia_ficcion

        (anyo_publicacion 2000)
        (best_seller FALSE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "ed6")
        (escrito_por [SBCFinal_Class21])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class4])
        (num_pag 300)
        (puntuacion 110)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class11])
        (titulo "lib21"))

([SBCFinal_Class20002] of  Ciencia_ficcion

        (anyo_publicacion 1900)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edi1")
        (escrito_por [SBCFinal_Class20])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 350)
        (puntuacion 12)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class10])
        (titulo "lib22"))

([SBCFinal_Class20003] of  Ciencia_ficcion

        (anyo_publicacion 2000)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edi6")
        (escrito_por [SBCFinal_Class21])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 250)
        (puntuacion 5)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class12])
        (titulo "lib23"))

([SBCFinal_Class20004] of  Ciencia_ficcion

        (anyo_publicacion 1990)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "ed4")
        (escrito_por [SBCFinal_Class23])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class4]
                [SBCFinal_Class0])
        (num_pag 100)
        (puntuacion 13)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class12])
        (titulo "lib24"))

([SBCFinal_Class20005] of  Ciencia_ficcion

        (anyo_publicacion 2005)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class19])
        (hard FALSE)
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 200)
        (puntuacion 15)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class10])
        (titulo "lib25"))

([SBCFinal_Class20006] of  Ciencia_ficcion

        (anyo_publicacion 2015)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit2")
        (escrito_por [SBCFinal_Class22])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1])
        (num_pag 321)
        (puntuacion 20)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class12])
        (titulo "lib26"))

([SBCFinal_Class20007] of  Ciencia_ficcion

        (anyo_publicacion 2009)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class21])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class1]
                [SBCFinal_Class3])
        (num_pag 100)
        (puntuacion 0)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class15])
        (titulo "lib27"))

([SBCFinal_Class20008] of  Ciencia_ficcion

        (anyo_publicacion 1990)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class20])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class2]
                [SBCFinal_Class3])
        (num_pag 350)
        (puntuacion 13)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class15])
        (titulo "lib28"))

([SBCFinal_Class20009] of  Ciencia_ficcion

        (anyo_publicacion 2005)
        (best_seller FALSE)
        (clasico_literatura FALSE)
        (edad_recomendada 18)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class19])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class2]
                [SBCFinal_Class1]
                [SBCFinal_Class4])
        (num_pag 1000)
        (puntuacion 20)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class15])
        (titulo "lib29"))

([SBCFinal_Class20010] of  Ciencia_ficcion

        (anyo_publicacion 2001)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class19])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1])
        (num_pag 600)
        (puntuacion 23)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class14])
        (titulo "lib30"))

([SBCFinal_Class20011] of  Ciencia_ficcion

        (anyo_publicacion 2003)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo TRUE)
        (editorial "edit8")
        (escrito_por [SBCFinal_Class22])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class4]
                [SBCFinal_Class3])
        (num_pag 560)
        (puntuacion 30)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class14])
        (titulo "lib31"))

([SBCFinal_Class20012] of  Ciencia_ficcion

        (anyo_publicacion 1999)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 18)
        (edicion_bolsillo FALSE)
        (editorial "ed4")
        (escrito_por [SBCFinal_Class21])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class1])
        (num_pag 400)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class14])
        (titulo "lib32"))

([SBCFinal_Class20013] of  Ciencia_ficcion

        (anyo_publicacion 2000)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit5")
        (escrito_por [SBCFinal_Class21])
        (hard TRUE)
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 120)
        (puntuacion 1)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class13])
        (titulo "lib33"))

([SBCFinal_Class20014] of  Ciencia_ficcion

        (anyo_publicacion 2008)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edit6")
        (escrito_por [SBCFinal_Class23])
        (hard FALSE)
        (idioma_disponible
                [SBCFinal_Class2]
                [SBCFinal_Class1])
        (num_pag 210)
        (puntuacion 20)
        (saga TRUE)
        (subgenero_cf [SBCFinal_Class13])
        (titulo "lib26"))

([SBCFinal_Class20015] of  Ciencia_ficcion

        (anyo_publicacion 1950)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 18)
        (edicion_bolsillo FALSE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class19])
        (hard TRUE)
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class3]
                [SBCFinal_Class1]
                [SBCFinal_Class4]
                [SBCFinal_Class2])
        (num_pag 1000)
        (puntuacion 30)
        (saga FALSE)
        (subgenero_cf [SBCFinal_Class13])
        (titulo "lib34"))

([SBCFinal_Class20017] of  Fantasia

        (anyo_publicacion 1980)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "ed1")
        (escrito_por [SBCFinal_Class19])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class3]
                [SBCFinal_Class1]
                [SBCFinal_Class4]
                [SBCFinal_Class2])
        (num_pag 800)
        (puntuacion 50)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class7])
        (titulo "lib35"))

([SBCFinal_Class20018] of  Fantasia

        (anyo_publicacion 2006)
        (best_seller FALSE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo TRUE)
        (editorial "ed1")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible [SBCFinal_Class1])
        (num_pag 50)
        (puntuacion 11)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class5])
        (titulo "lib37"))

([SBCFinal_Class20019] of  Fantasia

        (anyo_publicacion 2001)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "ed2")
        (escrito_por [SBCFinal_Class20])
        (idioma_disponible
                [SBCFinal_Class4]
                [SBCFinal_Class1]
                [SBCFinal_Class0])
        (num_pag 500)
        (puntuacion 12)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class7])
        (titulo "lib36"))

([SBCFinal_Class20020] of  Fantasia

        (anyo_publicacion 1900)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "ed3")
        (escrito_por [SBCFinal_Class23])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1]
                [SBCFinal_Class3]
                [SBCFinal_Class4]
                [SBCFinal_Class2])
        (num_pag 70)
        (puntuacion 25)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class5])
        (titulo "lib38"))

([SBCFinal_Class20021] of  Fantasia

        (anyo_publicacion 2011)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class2])
        (num_pag 150)
        (puntuacion 0)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class6])
        (titulo "lib39"))

([SBCFinal_Class20022] of  Fantasia

        (anyo_publicacion 1990)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 18)
        (edicion_bolsillo TRUE)
        (editorial "edit5")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible
                [SBCFinal_Class1]
                [SBCFinal_Class0])
        (num_pag 650)
        (puntuacion 20)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class6])
        (titulo "lib40"))

([SBCFinal_Class20023] of  Fantasia

        (anyo_publicacion 2012)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edit7")
        (escrito_por [SBCFinal_Class20])
        (idioma_disponible
                [SBCFinal_Class1]
                [SBCFinal_Class4])
        (num_pag 306)
        (puntuacion 14)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class6])
        (titulo "lib41"))

([SBCFinal_Class20024] of  Fantasia

        (anyo_publicacion 1997)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 18)
        (edicion_bolsillo TRUE)
        (editorial "edit1")
        (escrito_por [SBCFinal_Class19])
        (idioma_disponible
                [SBCFinal_Class2]
                [SBCFinal_Class3]
                [SBCFinal_Class0])
        (num_pag 900)
        (puntuacion 50)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class8])
        (titulo "lib42"))

([SBCFinal_Class20025] of  Fantasia

        (anyo_publicacion 1960)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 16)
        (edicion_bolsillo TRUE)
        (editorial "edt4")
        (escrito_por [SBCFinal_Class23])
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 300)
        (puntuacion 12)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class8])
        (titulo "lib43"))

([SBCFinal_Class20026] of  Fantasia

        (anyo_publicacion 1800)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo FALSE)
        (editorial "edit5")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1]
                [SBCFinal_Class3]
                [SBCFinal_Class4]
                [SBCFinal_Class2])
        (num_pag 100)
        (puntuacion 20)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class8])
        (titulo "lib44"))

([SBCFinal_Class20027] of  Fantasia

        (anyo_publicacion 1950)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 18)
        (edicion_bolsillo TRUE)
        (editorial "edit9")
        (escrito_por [SBCFinal_Class19])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class2])
        (num_pag 350)
        (puntuacion 10)
        (saga FALSE)
        (subgenero_fant [SBCFinal_Class9])
        (titulo "lib45"))

([SBCFinal_Class20028] of  Fantasia

        (anyo_publicacion 2005)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "ed1")
        (escrito_por [SBCFinal_Class21])
        (idioma_disponible
                [SBCFinal_Class2]
                [SBCFinal_Class0]
                [SBCFinal_Class3])
        (num_pag 150)
        (puntuacion 1)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class9])
        (titulo "lib46"))

([SBCFinal_Class20029] of  Fantasia

        (anyo_publicacion 1999)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo TRUE)
        (editorial "edit5")
        (escrito_por [SBCFinal_Class20])
        (idioma_disponible
                [SBCFinal_Class1]
                [SBCFinal_Class3])
        (num_pag 530)
        (puntuacion 2)
        (saga TRUE)
        (subgenero_fant [SBCFinal_Class9])
        (titulo "lib47"))

([SBCFinal_Class20030] of  Misterio

        (anyo_publicacion 2003)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit3")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible
                [SBCFinal_Class2]
                [SBCFinal_Class0])
        (num_pag 350)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class16])
        (titulo "lib48"))

([SBCFinal_Class20031] of  Misterio

        (anyo_publicacion 1998)
        (best_seller FALSE)
        (clasico_literatura TRUE)
        (edad_recomendada 16)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class19])
        (idioma_disponible
                [SBCFinal_Class0]
                [SBCFinal_Class1])
        (num_pag 430)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class16])
        (titulo "lib49"))

([SBCFinal_Class20032] of  Misterio

        (anyo_publicacion 2000)
        (best_seller TRUE)
        (clasico_literatura TRUE)
        (edad_recomendada 1)
        (edicion_bolsillo TRUE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class23])
        (idioma_disponible [SBCFinal_Class2])
        (num_pag 500)
        (puntuacion 20)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class17])
        (titulo "lib50"))

([SBCFinal_Class20033] of  Misterio

        (anyo_publicacion 2006)
        (best_seller TRUE)
        (clasico_literatura FALSE)
        (edad_recomendada 18)
        (edicion_bolsillo FALSE)
        (editorial "edit4")
        (escrito_por [SBCFinal_Class22])
        (idioma_disponible [SBCFinal_Class0])
        (num_pag 300)
        (puntuacion 10)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class17])
        (titulo "lib51"))

([SBCFinal_Class21] of  Autor

        (inverse_of_escrito_por
                [SBCFinal_Class26]
                [SBCFinal_Class10004]
                [SBCFinal_Class10011]
                [SBCFinal_Class10014]
                [SBCFinal_Class10015]
                [SBCFinal_Class20001]
                [SBCFinal_Class20003]
                [SBCFinal_Class20007]
                [SBCFinal_Class20012]
                [SBCFinal_Class20013]
                [SBCFinal_Class20018]
                [SBCFinal_Class20021]
                [SBCFinal_Class20028])
        (Nacionalidad "nac2")
        (Nombre "autor3"))

([SBCFinal_Class22] of  Autor

        (inverse_of_escrito_por
                [SBCFinal_Class10001]
                [SBCFinal_Class10003]
                [SBCFinal_Class10005]
                [SBCFinal_Class10007]
                [SBCFinal_Class10009]
                [SBCFinal_Class10010]
                [SBCFinal_Class20006]
                [SBCFinal_Class20011]
                [SBCFinal_Class20022]
                [SBCFinal_Class20026]
                [SBCFinal_Class20030]
                [SBCFinal_Class20033])
        (Nacionalidad "nac3")
        (Nombre "autor4"))

([SBCFinal_Class23] of  Autor

        (inverse_of_escrito_por
                [SBCFinal_Class10002]
                [SBCFinal_Class10006]
                [SBCFinal_Class10013]
                [SBCFinal_Class20000]
                [SBCFinal_Class20004]
                [SBCFinal_Class20014]
                [SBCFinal_Class20020]
                [SBCFinal_Class20025]
                [SBCFinal_Class20032])
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
        (puntuacion 10)
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
        (puntuacion 17)
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
        (puntuacion 19)
        (saga TRUE)
        (subgenero_mist [SBCFinal_Class16])
        (titulo "libro3"))

([SBCFinal_Class3] of  Idioma

        (idioma "aleman")
        (inverse_of_idioma_disponible
                [SBCFinal_Class10000]
                [SBCFinal_Class10003]
                [SBCFinal_Class10010]
                [SBCFinal_Class10013]
                [SBCFinal_Class20007]
                [SBCFinal_Class20008]
                [SBCFinal_Class20011]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20020]
                [SBCFinal_Class20024]
                [SBCFinal_Class20026]
                [SBCFinal_Class20028]
                [SBCFinal_Class20029]))

([SBCFinal_Class4] of  Idioma

        (idioma "chino")
        (inverse_of_idioma_disponible
                [SBCFinal_Class10000]
                [SBCFinal_Class10001]
                [SBCFinal_Class10002]
                [SBCFinal_Class10004]
                [SBCFinal_Class10006]
                [SBCFinal_Class20001]
                [SBCFinal_Class20004]
                [SBCFinal_Class20009]
                [SBCFinal_Class20011]
                [SBCFinal_Class20015]
                [SBCFinal_Class20017]
                [SBCFinal_Class20019]
                [SBCFinal_Class20020]
                [SBCFinal_Class20023]
                [SBCFinal_Class20026]))

([SBCFinal_Class5] of  Subgenero_fantasia

        (inverse_of_subgenero_fant
                [SBCFinal_Class25]
                [SBCFinal_Class10015]
                [SBCFinal_Class20018]
                [SBCFinal_Class20020])
        (subgenero_fantasia "cuentos_clasicos"))

([SBCFinal_Class6] of  Subgenero_fantasia

        (inverse_of_subgenero_fant
                [SBCFinal_Class10008]
                [SBCFinal_Class20021]
                [SBCFinal_Class20022]
                [SBCFinal_Class20023])
        (subgenero_fantasia "magia_y_espada"))

([SBCFinal_Class7] of  Subgenero_fantasia

        (inverse_of_subgenero_fant
                [SBCFinal_Class10007]
                [SBCFinal_Class10014]
                [SBCFinal_Class20017]
                [SBCFinal_Class20019])
        (subgenero_fantasia "alta_fantasia"))

([SBCFinal_Class8] of  Subgenero_fantasia

        (inverse_of_subgenero_fant
                [SBCFinal_Class10009]
                [SBCFinal_Class20024]
                [SBCFinal_Class20025]
                [SBCFinal_Class20026])
        (subgenero_fantasia "medieval"))

([SBCFinal_Class9] of  Subgenero_fantasia

        (inverse_of_subgenero_fant
                [SBCFinal_Class10010]
                [SBCFinal_Class20027]
                [SBCFinal_Class20028]
                [SBCFinal_Class20029])
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

(defmessage-handler MAIN::Ciencia_ficcion mostrar-cf ()
        (format t "Subgenero: %s"  (send ?self:subgenero_cf get-subgenero_ciencia_ficcion))
)

(defmessage-handler MAIN::Fantasia mostrar-fant ()
        (format t "Subgenero: %s"  (send ?self:subgenero_fant get-subgenero_fantasia))
)

(defmessage-handler MAIN::Misterio mostrar-mist ()
        (format t "Subgenero: %s"  (send ?self:subgenero_mist get-subgenero_misterio))
)

(defmessage-handler MAIN::Libro plantilla ()
        (format t "Titulo: %s %n" ?self:titulo)
        (printout t crlf)
        (if (eq (class ?self) Ciencia_ficcion) then
                (printout t "Genero: Ciencia ficcion" crlf)
                (printout t (send ?self mostrar-cf))
        else (if (eq (class ?self) Misterio) then
                (printout t "Genero: Misterio" crlf)
                (printout t (send ?self mostrar-mist))
        )else (if (eq (class ?self) Fantasia) then
                (printout t "Genero: Fantasia" crlf)
                (printout t (send ?self mostrar-fant))
        )
        )
        (printout t crlf)
        (format t "Editorial: %s" ?self:editorial)
                (printout t crlf)
        (format t "Autor: %s" (send ?self:escrito_por get-Nombre))
                (printout t crlf)
        (format t "Anyo de publicacion: %d %n" ?self:anyo_publicacion)
                (printout t "Idiomas disponibles:" crlf)
        (progn$ (?id-disp (send ?self get-idioma_disponible))
                (format t " - %s" (send ?id-disp get-idioma))
                        (printout t crlf)
        )
)

(defmessage-handler MAIN::Solucion mostrar ()
        (printout t "+++++++++++++++++++++++++++++++++" crlf)
        (format t "Afinidad: %d %n" ?self:puntuacion)
        (printout t (send ?self:libro plantilla))
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
        (assert (clasico-literatura ask))
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
                                (assert (genero-elegido Fantasia))
                        )
                        (case 2
                                then
                                (assert (genero-elegido Ciencia_ficcion))
                                (assert (cf-hard ask))
                        )
                        (case 3
                                then 
                                (assert (genero-elegido Misterio))
                        )
                )
        )
        (retract ?generos-libros)
        (assert (generos-libros TRUE))
)

(defrule recopilacion-prefs::relacionado-ciencia-ficcion "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-elegido Ciencia_ficcion))
        =>
        (assert (subgenero-cf-fav FALSE))
        (assert (cf-hard FALSE))
)

(defrule recopilacion-prefs::relacionado-misterio "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-elegido Misterio))
        =>
        (assert (subgenero-mist-fav FALSE))
)

(defrule recopilacion-prefs::relacionado-fantasia "Descarta preguntas no relacionadas con Misterio"
        (generos-libros TRUE)
        (not (genero-elegido Fantasia))
        =>
        (assert (subgenero-fant-fav FALSE))
)

(defrule recopilacion-prefs::pregunta-subgeneros-fant-favoritos "Pregunta al usuario"
        ?hecho <- (subgenero-fant-fav ask)
        (genero-elegido Fantasia)
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
        (genero-elegido Ciencia_ficcion)
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
        (genero-elegido Misterio)
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
        ?hecho <- (subgenero-mist-fav elegir)
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
        ?hecho <- (clasico-literatura ask)
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
        (retract ?hecho)
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
        ?h10 <- (clasico-literatura TRUE|FALSE)
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
        ?hecho <- (subgenero-cf-fav ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (subgenero-cf-fav ?curr-gen))
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
        (bind ?nombre (send $?subfant get-subgenero_fantasia))
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
        (bind ?nombre (send $?subcf get-subgenero_ciencia_ficcion))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 50))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 50))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 50))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 25))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 0))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 0))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (infantil-valorado ?cont))
)

(defrule procesado::valorar-infantil-misterio "Se mejora la puntuacion de los libros adecuados para personas menores de 12 anyos"
        (Usuario (edad ?e))
        (test (< ?e 13))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?submist) (edad_recomendada ?edad_min))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (infantil-valorado ?cont))
        =>
        (bind ?nombre (send $?submist get-subgenero_misterio))
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 100))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 75))
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
        (not (adolescente-valorado-cf ?cont))
        =>
                (bind ?nombre (send $?subcf get-subgenero_ciencia_ficcion))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 100))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 100))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 50))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 75))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 100))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado-cf ?cont))
)

(defrule procesado::valorar-adolescente-fantasia "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 12) (< ?e 18)))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?subfant) (edad_recomendada ?edad_media))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (adolescente-valorado-fant ?cont))
        =>
        (bind ?nombre (send $?subfant get-subgenero_fantasia))
                (switch ?nombre
                        (case "cuentos_clasicos" then 
                                (bind ?p (+ ?p 50))
                        )
                        (case "magia_y_espada" then
                                (bind ?p (+ ?p 150))
                        )
                        (case "alta_fantasia" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "medieval" then
                                (bind ?p (+ ?p 100))
                        )
                        (case "terror" then
                                (bind ?p (+ ?p 125))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado-fant ?cont))
)


(defrule procesado::valorar-adolescente-misterio "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 12) (< ?e 18)))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?submist) (edad_recomendada ?edad_media))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (adolescente-valorado-mist ?cont))
        =>
          (bind ?nombre (send $?submist get-subgenero_misterio))        
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 125))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 125))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (adolescente-valorado-mist ?cont))
)


(defrule procesado::valorar-mayor-ciencia-ficcion "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 18))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Ciencia_ficcion) (subgenero_cf $?subcf) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado-cf ?cont))
        =>
        (bind ?nombre (send $?subcf get-subgenero_ciencia_ficcion))
                (switch ?nombre
                        (case "robotica_y_inteligencia_artificial" then 
                                (bind ?p (+ ?p 100))
                        )
                        (case "viajes_en_el_tiempo" then
                                (bind ?p (+ ?p 75))
                        )
                        (case "espacio" then
                                (bind ?p (+ ?p 75))
                        )
                        (case "social_utopia" then
                                (bind ?p (+ ?p 50))
                        )
                        (case "social_alterantivo" then
                                (bind ?p (+ ?p 100))
                        )
                        (case "social_distopia" then
                                (bind ?p (+ ?p 100))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (mayor-valorado-cf ?cont))
)



(defrule procesado::valorar-mayor-fantasia "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 18))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Fantasia) (subgenero_fant $?subfant) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado-fant ?cont))
        =>
        (bind ?nombre (send $?subfant get-subgenero_fantasia))
                (switch ?nombre
                        (case "cuentos_clasicos" then 
                                (bind ?p (+ ?p 75))
                        )
                        (case "magia_y_espada" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "alta_fantasia" then
                                (bind ?p (+ ?p 150))
                        )
                        (case "medieval" then
                                (bind ?p (+ ?p 125))
                        )
                        (case "terror" then
                                (bind ?p (+ ?p 125))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (mayor-valorado-fant ?cont))
)

(defrule procesado::valorar-mayor-misterio "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 18))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        ?cont <-(object (is-a Misterio) (subgenero_mist $?submist) (edad_recomendada ?edad_mayor))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (mayor-valorado-mist ?cont))
        =>
        (bind ?nombre (send $?submist get-subgenero_misterio))
                (switch ?nombre
                        (case "policial" then 
                                (bind ?p (+ ?p 150))
                        )
                        (case "suspense" then
                                (bind ?p (+ ?p 125))
                        )
        )
        (send ?rec put-puntuacion ?p)
        (assert (mayor-valorado-mist ?cont))
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
;;(defrule procesado::descartar-sagas "Descarta los libros que pertenezcan a sagas"
;;        (declare (salience 10))
;;        (saga-libros FALSE)
;;        ?cont <- (object (is-a Libro) (saga TRUE))
;;        ?rec <- (object (is-a Solucion) (libro ?lib))
;;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;;        =>
;;        (send ?rec delete)
;;)

;;(defrule procesado::descartar-best-sellers "Descarta los libros que hayan sido nombrados best sellers"
;;        (declare (salience 10))
;;        (libro-best-seller FALSE)
;;        ?cont <- (object (is-a Libro) (best_seller TRUE))
;;        ?rec <- (object (is-a Solucion) (libro ?lib))
;;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;;       =>
;;        (send ?rec delete)
;;)

;;(defrule procesado::descartar-autor-extranjero "Descarta los libros escritos por autores extranjeros"
;;        (declare (salience 10))
;;        (autor-extranjero FALSE)
;;        ?cont <- (object (is-a Libro) (best_seller TRUE))
;;        ?rec <- (object (is-a Solucion) (libro ?lib))
;;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;;        =>
;;        (send ?rec delete)
;;)

;;(defrule procesado::descartar-sin-ediciones-de-bolsillo "Descarta los libros sin edicion de bolisllo"
;;        (declare (salience 10))
;;        (transporte-publico TRUE)
;;        ?cont <- (object (is-a Libro) (edicion_bolsillo FALSE))
;;        ?rec <- (object (is-a Solucion) (libro ?lib))
;;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;;        =>
;;        (send ?rec delete)
;;)

;;(defrule procesado::descartar-clasicos-literatura "Descarta los clasicos de la literatura"
;;        (declare (salience 10))
;;        (clasico-literatura FALSE)
;;        ?cont <- (object (is-a Libro) (clasico_literatura FALSE))
;;        ?rec <- (object (is-a Solucion) (libro ?lib))
;;        (test (eq (instance-name ?cont) (instance-name ?lib)))
;;        =>
;;        (send ?rec delete)        
;;)


(defrule procesado::valorar-cf-hard "Mejora la puntuacion de los libros de ciencia ficcion hard"
        (cf-hard TRUE)
        ?cont <- (object (is-a Libro) (hard TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (hard-valorado ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (hard-valorado ?cont))
)

(defrule procesado::valorar-cf-hard-no "Mejora la puntuacion de los libros de ciencia ficcion hard"
        (cf-hard FALSE)
        ?cont <- (object (is-a Libro) (hard FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (hard-valorado-no ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (hard-valorado-no ?cont))
)

(defrule procesado::valorar-saga "Mejora la puntuacion de los libros que pertenezcan a saga"
        (saga-libros TRUE)
        ?cont <- (object (is-a Libro) (saga TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (saga-valorada ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (saga-valorada ?cont))
)

(defrule procesado::valorar-saga-no "Mejora la puntuacion de los libros que no pertenezcan a saga"
        (saga-libros FALSE)
        ?cont <- (object (is-a Libro) (saga FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (saga-valorada-no ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (saga-valorada-no ?cont))
)

(defrule procesado::valorar-best-seller "Mejora la puntuacion de los libros que hayan sido nombrados best sellers"
        (libro-best-seller TRUE)
        ?cont <- (object (is-a Libro) (best_seller TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (best-seller-valorado ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (best-seller-valorado ?cont))
)

(defrule procesado::valorar-best-seller-no "Mejora la puntuacion de los libros que no hayan sido nombrados best sellers"
        (libro-best-seller FALSE)
        ?cont <- (object (is-a Libro) (best_seller FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (best-seller-valorado-no ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (best-seller-valorado-no ?cont))
)


(defrule procesado::valorar-edicion-bolsillo "Mejora la puntuacion de los libros con edicion de bolisllo"
        (transporte-publico TRUE)
        ?cont <- (object (is-a Libro) (edicion_bolsillo TRUE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (edicion-bolsillo-valorado ?cont))
        =>
        (bind ?p (+ ?p 50))
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
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (clasico-literatura-valorado ?cont))
)

(defrule procesado::valorar-clasico-literatura-no "Mejora la puntuacion de los que no son clasicos de la literatura"
        (clasico-literatura FALSE)
        ?cont <- (object (is-a Libro) (clasico_literatura FALSE))
        ?rec <- (object (is-a Solucion) (libro ?lib) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?lib)))
        (not (clasico-literatura-valorado-no ?cont))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (assert (clasico-literatura-valorado-no ?cont))
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
        (not (final))
        =>
        (printout t "Estos son los 3 libros que le recomendamos" crlf)
        (printout t crlf)
        (progn$ (?curr $?soluciones)
                (printout t (send ?curr mostrar))
        )
        ;(printout t (send (nth 0 ?soluciones) mostrar))
        ;(printout t (send (nth 1 ?soluciones) mostrar))
        ;(printout t (send (nth 2 ?soluciones) mostrar))
        (assert (final))
)
