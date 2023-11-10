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
			objetivo.aceitePuro(false)
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

class HechizoComun {
	const cantidadQueDisminuye
	
	method lanzar(bot, objetivo) {
		if (bot.cargaElectrica() > cantidadQueDisminuye) {
			objetivo.disminuirCargaElectrica(cantidadQueDisminuye)
		}
	}
}