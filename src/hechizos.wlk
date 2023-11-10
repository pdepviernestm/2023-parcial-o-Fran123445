import bots.*
import casas.*

object inmobilus {
	method lanzar(bot, objetivo) {
		objetivo.disminuirCargaElectrica(50)
	}
}

object sectumSempra {
	method lanzar(bot, objetivo) {
		if (bot.esExperimentado()) {
			if (objetivo.aceitePuro()) {
				objetivo.cambiarAceite()
			}
		}
	}
}

object avadakedabra {
	method lanzar(bot, objetivo) {
		if(not(bot.aceitePuro()) || bot.casa().esPeligrosa()) {
			objetivo.anularCargaElectrica()
		}
	}
}


// Hechizo inventado
// Selecciona los 2 primeros hechizos y los lanza
// Los alumnos no pueden aprender este hechizo ni como primer hechizo
// ni segundo porque sino se les funde la CPU, pero eso esta a cargo de los profesores, 
// no de este modelo
object combinado {
	method lanzar(bot, objetivo) {
		var hechizos = [bot.hechizosAprendidos().get(0), bot.hechizosAprendidos().get(1)]
		hechizos.forEach({h => h.lanzar(bot, objetivo)})		
	}
}

class HechizoComun {
	const cantidadQueDisminuye
	
	method lanzar(bot, objetivo) {
		if (bot.cargaElectrica() > cantidadQueDisminuye) {
			objetivo.disminuirCargaElectrica(cantidadQueDisminuye)
		}
	}
}