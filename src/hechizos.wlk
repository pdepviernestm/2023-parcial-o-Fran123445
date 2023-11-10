import bots.*
import casas.*

class Hechizo {
	method lanzar(bot, objetivo)
}

class Inmobilus inherits Hechizo {
	override method lanzar(bot, objetivo) {
		objetivo.disminuirCargaElectrica(50)
	}
}

class sectumSempra inherits Hechizo {
	override method lanzar(bot, objetivo) {
		if (bot.experimentado()) {
			objetivo.aceitePuro(false)
		}
	}
}

class Avadakedabra inherits Hechizo {
	override method lanzar(bot, objetivo) {
		if(not(bot.aceitePuro()) || bot.casa().esPeligrosa()) {
			objetivo.anularCargaElectrica()
		}
	}
}

class HechizoComun inherits Hechizo {
	const cantidadQueDisminuye
	
	override method lanzar(bot, objetivo) {
		if (bot.cargaElectrica() > cantidadQueDisminuye) {
			objetivo.disminuirCargaElectrica(cantidadQueDisminuye)
		}
	}
}