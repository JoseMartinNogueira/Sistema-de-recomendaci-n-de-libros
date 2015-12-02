;;; Declaracion de templates --------------------------

;;; Template para los datos personales del usuario
;;valorar segun las preguntas
(deftemplate MAIN::Usuario
        (slot nombre (type STRING))
        (slot sexo (type SYMBOL) (default desconocido))
        (slot edad (type INTEGER) (default -1))
        (slot familia (type SYMBOL) (default desconocido))
)

;;; Template para las preferencias del usuario
(deftemplate MAIN::preferencias
        (multislot idiomas (type INSTANCE))
        (multislot autores-favoritos (type INSTANCE)) ; nuevo
        (multislot subgeneros-cf-favoritos (type INSTANCE)) ; nuevo
        (multislot subgeneros-mist-favoritos (type INSTANCE)) ; nuevo
        (multislot subgeneros-fant-favoritos (type INSTANCE)) ; nuevo
)

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


(defrule procesado::anadir-Ciencia-ficcion "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Ciencia_ficcion)
        =>
        (bind $?lista (find-all-instances ((?inst Ciencia_ficcion)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

(defrule procesado::anadir-Fantasia "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Fantasia)
        =>
        (bind $?lista (find-all-instances ((?inst Fantasia)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

(defrule procesado::anadir-Misterio "Se añade todos los libros, luego se filtran"
        ?hecho <- (genero-elegido Misterio)
        =>
        (bind $?lista (find-all-instances ((?inst Misterio)) TRUE))
        (progn$ (?curr-con ?lista)
                (make-instance (gensym) of Solucion (libro ?curr-con) (puntuacion (send ?curr-con get-puntuacion)))
        )       
        (retract ?hecho)
)

;;;;;------------------------------------------------------------

;-----
(defrule procesado::aux-genero "Crea hechos para poder procesar los generos favoritos"
        (preferencias (generos-favoritos $?gen))
        ?hecho <- (genero-favorito ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-gen $?gen)
                        (assert (genero-favorito ?curr-gen))
                )
        )
)

(defrule procesado::aux-tematica "Crea hechos para poder procesar las tematicas favoritas"
        (preferencias (tematicas-favoritas $?tem))
        ?hecho <- (tematica-favorita ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE)then 
                (progn$ (?curr-tem $?tem)
                        (assert (tematica ?curr-tem))
                )
        )
)

;-----


(defrule procesado::valorar-edad "Se quitan las peliculas que no cumplan la recomendacion de edades"
        (Usuario (edad ?e))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta))
        ?cont <-(object (is-a Contenido) (clasificacion_edades ?min-edad))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (test (< ?e ?min-edad))
        =>
        (send ?rec delete)
)

(defrule procesado::valorar-ninyo-peliculas "Se mejora la puntuacion de los contenidos adecuados a ninyos"
        (Usuario (edad ?e))
        (test (< ?e 14))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Pelicula) (pelicula_genero $?generos) (duracion ?duracion) (clasificacion_edades ?min-edad))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-ninyo ?cont))
        =>
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "animacion" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género animación -> +150"))
                        )
                        (case "aventuras" then
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género aventuras -> +125")) 
                        )
                        (case "fantasia" then
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género fantasia -> +125")) 
                        )
                        (case "comedia" then
                                (bind ?p (+ ?p 75))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género comedia -> +75"))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-ninyo ?cont)) 
)

(defrule procesado::valorar-ninyo-serie "Se mejora la puntuacion de los contenidos adecuados a ninyos"
        (Usuario (edad ?e))
        (test (< ?e 14))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Serie) (serie_genero $?generos) (duracion ?duracion) (clasificacion_edades ?min-edad))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-ninyo ?cont))
        =>
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "animacion" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género animación -> +150"))
                        )
                        (case "aventuras" then
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género aventuras -> +125")) 
                        )
                        (case "fantasia" then
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género fantasia -> +125")) 
                        )
                        (case "comedia" then
                                (bind ?p (+ ?p 75))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es infantil y es de género comedia -> +75"))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-ninyo ?cont))
)


(defrule procesado::valorar-adolescente-pelicula "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 14) (< ?e 23)))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Pelicula) (pelicula_genero $?generos) (de_moda ?moda) (anyo ?anyo) (contenido_animo $?animos))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-adolescente ?cont))
        =>
        (if (eq ?moda TRUE) then
                (bind ?p (+ ?p 150))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y está de moda -> +150")) 
        )
        (if (> ?anyo 2005) then
                (bind ?p (+ ?p 50))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es reciente -> +50")) 
        )
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "comedia" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es de género comedia -> +100"))
                        )
                )
        )
        (progn$ (?curr-ani $?animos)
                (bind ?nombre (send ?curr-ani get-animo))
                (switch ?nombre
                        (case "trepidante" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es trepidante -> +150"))
                        )
                        (case "gracioso" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es gracioso -> +150"))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-adolescente ?cont))
)

(defrule procesado::valorar-adolescente-serie "Se mejora la puntuacion de los contenidos adecuados a adolescentes"
        (Usuario (edad ?e))
        (test (and (>= ?e 14) (< ?e 23)))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Serie) (serie_genero $?generos) (de_moda ?moda) (anyo ?anyo) (contenido_animo $?animos))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-adolescente ?cont))
        =>
        (if (eq ?moda TRUE) then
                (bind ?p (+ ?p 150))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y está de moda -> +150")) 
        )
        (if (> ?anyo 2005) then
                (bind ?p (+ ?p 50))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es reciente -> +50")) 
        )
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "comedia" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es de género comedia -> +100"))
                        )
                )
        )
        (progn$ (?curr-ani $?animos)
                (bind ?nombre (send ?curr-ani get-animo))
                (switch ?nombre
                        (case "trepidante" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es trepidante -> +150"))
                        )
                        (case "gracioso" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es adolescente y es gracioso -> +150"))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-adolescente ?cont))
)

(defrule procesado::valorar-mayor-serie "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 63))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Serie) (serie_genero $?generos) (de_moda ?moda) (anyo ?anyo) (contenido_animo $?animos) (trata_de $?argumentos))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-mayor ?cont))
        =>
        (bind ?p (+ ?p -75))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es una serie -> -75")) 
        (if (< ?anyo 1970) then
                (bind ?p (+ ?p 150))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es antiguo -> +150")) 
        )
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "historico" then
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es de género histórico -> +100"))
                        )
                        (case "western" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es un western -> +100"))
                        )
                        (case "musical" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es de género musical -> +100"))
                        )
                )
        )
        (progn$ (?curr-ani $?animos)
                (bind ?nombre (send ?curr-ani get-animo))
                (switch ?nombre
                        (case "sentimental" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es sentimental -> +100"))
                        )
                        (case "senta_bien" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y senta bien -> +100"))
                        )
                )
        )
        (progn$ (?curr-arg $?argumentos)
                (bind ?nombre (send ?curr-arg get-argumento))
                (switch ?nombre
                        (case "guerra_civil" then 
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y va de la guerra civil -> +125"))
                        )
                        (case "anyos60" then
                                (bind ?p (+ ?p 50))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y va de la década de los 60 -> +150"))
                        )       
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-mayor ?cont))
)

(defrule procesado::valorar-mayor-pelicula "Se mejora la puntuacion de los contenidos adecuados a personas mayores"
        (Usuario (edad ?e))
        (test (>= ?e 63))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        ?cont <-(object (is-a Pelicula) (pelicula_genero $?generos) (de_moda ?moda) (anyo ?anyo) (contenido_animo $?animos) (trata_de $?argumentos))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-mayor ?cont))
        =>
        (if (< ?anyo 1970) then
                (bind ?p (+ ?p 150))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es antiguo -> +150")) 
        )
        (progn$ (?curr-gen $?generos) 
                (bind ?nombre (send ?curr-gen get-genero))
                (switch ?nombre
                        (case "western" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es un western -> +100"))
                        )
                        (case "musical" then 
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es de género musical -> +100"))
                        )
                        (case "historico" then
                                (bind ?p (+ ?p 100))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es de género histórico -> +100"))
                        )
                )
        )
        (progn$ (?curr-ani $?animos)
                (bind ?nombre (send ?curr-ani get-animo))
                (switch ?nombre
                        (case "sentimental" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y es sentimental -> +150"))
                        )
                        (case "senta_bien" then 
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y senta bien -> +150"))
                        )
                )
        )
        (progn$ (?curr-arg $?argumentos)
                (bind ?nombre (send ?curr-arg get-argumento))
                (switch ?nombre
                        (case "guerra" then 
                                (bind ?p (+ ?p 125))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y va de la guerra -> +125"))
                        )
                        (case "anyos60" then
                                (bind ?p (+ ?p 150))
                                (bind $?just (insert$ $?just (+ (length$ $?just) 1) "El usuario es mayor y va de la década de los 60 -> +150"))
                        )
                )
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-mayor ?cont))
)


(defrule procesado::valorar-tematica-favorita "Se mejora la puntuacion de ldocumentales de tematica favorita"
        ?hecho <- (tematica ?tem)
        ?cont <-(object (is-a Documental) (docu_tematica ?tematica))
        (test (eq (instance-name ?tem) ?tematica))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-tematica-favorita ?cont ?tem))
        =>
        (bind ?p (+ ?p 150))
        (bind ?text (str-cat "Pertenece a la temática favorita " (send ?tem get-tematica) " -> +150"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-tematica-favorita ?cont ?tem))
)


(defrule procesado::valorar-genero-favorito-peliculas "Se mejora la puntuacion de las peliculas de genero favorito"
        ?hecho <- (genero-favorito ?gen)
        ?cont <-(object (is-a Pelicula) (pelicula_genero $?generos))
        (test (member$ ?gen $?generos))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-genero-favorito ?cont ?gen))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Pertenece al género favorito " (send ?gen get-genero) " -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-genero-favorito ?cont ?gen))
)


(defrule procesado::valorar-genero-favorito-series "Se mejora la puntuacion de las series de genero favorito"
        ?hecho <- (genero-favorito ?gen)
        ?cont <-(object (is-a Serie) (serie_genero $?generos))
        (test (member$ ?gen $?generos))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-genero-favorito ?cont ?gen))
        =>
        (bind ?p (+ ?p 50))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Pertenece al género favorito " (send ?gen get-genero) " -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-genero-favorito ?cont ?gen))
)


(defrule procesado::aux-nacionalidad "Crea hechos con las nacionalidades favoritas para porder tratarlas"
        (preferencias (nacionalidades $?nac))
        ?hecho <- (nacionalidad ?aux)
        (test (or (eq ?aux TRUE) (eq ?aux FALSE)))
        =>
        (retract ?hecho)
        (if (eq ?aux TRUE) then 
                (progn$ (?curr-nac $?nac)
                        (assert (nacionalidad ?curr-nac))
                )
        )
)


(defrule procesado::valorar-nacionalidad-favorita "Se mejora la puntuacion de los contenidos de las nacionalidades favoritas del usuario"
        (nacionalidad ?nac)
        ?cont <- (object (is-a Contenido) (hecha_en $?nacionalidades))
        (test (member$ ?nac $?nacionalidades))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-nacionalidad-favorita ?cont ?nac))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Es de la nacionalidad favorita " (send ?nac get-nacionalidad) " -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-nacionalidad-favorita ?cont ?nac))
)
        

(defrule procesado::valorar-subir-series "Se mejora la puntuacion de las series en general"
        (subir-series TRUE)
        ?cont <- (object (is-a Serie))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-subir-series ?cont))
        =>
        (bind ?text (str-cat "Es una serie y el usuario las ve normalmente -> + 125"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (bind ?p (+ ?p 125))
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-subir-series ?cont))
)

(defrule procesado::valorar-subir-documentales "Mejora la puntuacion de los documentales en general"
        (subir-documentales TRUE)
        ?cont <- (object (is-a Documental))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-subir-documental ?cont))
        =>
        (bind ?text (str-cat "Es un documental y el usuario los ve normalmente -> + 125"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (bind ?p (+ ?p 125))
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-subir-documental ?cont))
)
        

(defrule procesado::descartar-por-idioma "Se descartan las peliculas que el usuario no va a entender dependiendo de si tienen subtitulos o no"
        (declare (salience 10)) ; Para tener prioridad y descartar antes
        (preferencias (idiomas $?idiomas))
        (vo FALSE)
        ?cont <- (object (is-a Contenido) (en_idioma ?idioma))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (test (not (member$ ?idioma $?idiomas)))
        =>
        (send ?rec delete)
)

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

(defrule procesado::descartar-mudo "Se descartan los contenidos mudos"
        (declare (salience 10)) ; Para tener prioridad y descartar antes
        (mudo FALSE)
        ?cont <- (object (is-a Contenido) (es_mudo TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        =>
        (send ?rec delete)
)

(defrule procesado::descartar-blanconegro "Se descartan los contenidos en blanco y negro"
        (declare (salience 10)) ; Para tener prioridad y descartar antes
        (blanconegro FALSE)
        (clasicos FALSE)
        ?cont <- (object (is-a Contenido) (blanco_negro TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        =>
        (send ?rec delete)
)

(defrule procesado::valorar-series-espanyolas "Mejora la puntuacion de las series espanyolas"
        (series-espanyolas ?valorar)
        ?cont <- (object (is-a Serie) (hecha_en ?nac))
        (test (eq (send ?nac get-nacionalidad) "Espanya"))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-series-espanyolas ?cont))
        =>
        (if (eq ?valorar TRUE) 
                then
                        (bind ?p (+ ?p 100))
                        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es una serie espanyola -> +100"))
        )
        (if (eq ?valorar FALSE)
                then
                        (bind ?p (+ ?p -100))
                        (bind $?just (insert$ $?just (+ (length$ $?just) 1) "Es una serie espanyola -> -100"))
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-series-espanyolas ?cont))
)


(defrule procesado::valorar-aclamado-critica "Sube la puntuación de los contenidos aclamados por la critica"
        (aclamado-critica TRUE)
        ?cont <- (object (is-a Contenido) (aclamada_por_critica TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-aclamado-critica ?cont))
        =>
        (bind ?p (+ ?p 75))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Es un contenido aclamado por la crítica especializada -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-aclamado-critica ?cont))
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

(defrule procesado::valorar-indie "Modifica la puntuación de los contenidos según sean de bajo presupuesto o no"
        (indie ?indie)
        ?cont <- (object (is-a Contenido) (bajo_presupuesto TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-indie ?cont))
        =>
        (if (eq ?indie TRUE) then
                (bind ?p (+ ?p 75))
                (bind ?text (str-cat "Es un contenido de bajo presupuesto o independiente -> +75"))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        else
                (bind ?p (+ ?p -75))
                (bind ?text (str-cat "Es un contenido de bajo presupuesto o independiente -> -75"))
                (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        )
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-indie ?cont))
)

(defrule procesado::valorar-blanconegro "Mejora la puntuación de los contenidos en blanco y negro"
        (blanconegro TRUE)
        ?cont <- (object (is-a Contenido) (blanco_negro TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-blanconegro ?cont))
        =>
        (bind ?p (+ ?p 150))
        (send ?rec put-puntuacion ?p)
        (bind ?text (str-cat "Es un contenido en blanco y negro -> +150"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-justificaciones $?just)
        (assert (valorado-blanconegro ?cont))
)

(defrule procesado::valorar-mudo "Mejora la puntuación de los contenidos mudos"
        (mudo TRUE)
        ?cont <- (object (is-a Contenido) (es_mudo TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-mudo ?cont))
        =>
        (bind ?p (+ ?p 75))
        (bind ?text (str-cat "Es un contenido mudo -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-mudo ?cont))
)

(defrule procesado::valorar-buena-audiencia "Modifica la puntuación de los contenidos con buena audiencia"
        (buena-audiencia TRUE)
        ?cont <- (object (is-a Contenido) (buena_audiencia TRUE))
        ?rec <- (object (is-a Recomendacion) (contenido ?conta) (puntuacion ?p) (justificaciones $?just))
        (test (eq (instance-name ?cont) (instance-name ?conta)))
        (not (valorado-buena-audiencia ?cont))
        =>
        (bind ?p (+ ?p 75))
        (bind ?text (str-cat "Es un contenido que ha tenido buena audiencia -> +75"))
        (bind $?just (insert$ $?just (+ (length$ $?just) 1) ?text))
        (send ?rec put-puntuacion ?p)
        (send ?rec put-justificaciones $?just)
        (assert (valorado-buena-audiencia ?cont))
)
        
(defrule procesado::pasar-a-generacion "Pasa al modulo de generacion de respuestas"
        (declare(salience -10))
        =>
        (printout t "Generando respuesta..." crlf)
        (focus generacion)
)