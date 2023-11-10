import bots.*

class Casa {
	const integrantes
	
	method esPeligrosa() {
		var cantidadAceitePuro = integrantes.count({i => i.aceitePuro()})
		var cantidadAceiteSucio = integrantes.size()-cantidadAceitePuro
		
		return cantidadAceiteSucio > cantidadAceitePuro
	}
}

object griffindor inherits Casa(integrantes = []) {
	override method esPeligrosa() = false
}

object slytherin inherits Casa(integrantes = []) {
	override method esPeligrosa() = true
}

object ravenclaw inherits Casa(integrantes = []) {
	
}

object hufflepuff inherits Casa(integrantes = []) {
	
}
