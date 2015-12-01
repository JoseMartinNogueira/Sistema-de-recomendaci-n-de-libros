

;;; Modulos
(defmodule MAIN(export ?ALL))

;;;Modulo generacion de soluciones
(defmodule generador
	(import MAIN ?ALL)
	(export ?ALL)
)

;;; Modulo de representacion de soluciones
(defmodule reptresentacion
	(import MAIN ?ALL)
	(export ?ALL)
)


;;Mensajes

(defmessage-handler MAIN::Plantilla ()
	(format t "Titulo: %s %n" ?self:titulo)
	(format t "Editorial: %s" ?self:editoral)
	(format t "Autor: %s" (send ?self:escrito_por get-autor))
	(format t "Anyo de publicacion: %d" ?self:anyo_publicacion)
	(progn$ (?id-disp (send ?self idioma_disponible))
		(format t "%s" (send ?id-disp get-idioma))
	)
)

(defmessage-handler MAIN::Recomendacion ()
	(printout t "+++++++++++++++++++++++++++++++++" crlf)
	(format t "Afinidad: %d %n" ?self:puntuacion)
	(printout t (send ?self:plantilla))
)