import hechizos.*
import casas.*

class Bot {
	var property cargaElectrica
	var property aceitePuro
	
	method disminuirCargaElectrica(cantidad) {
		cargaElectrica -= cantidad
	}
	
	method anularCargaElectrica() {
		cargaElectrica = 0
	}
	
	method cambiarAceite() {
		aceitePuro = not(aceitePuro)
	}
}

object sombrero inherits Bot(cargaElectrica = 100, aceitePuro = true) {
	const casas = [gryffindor, slytherin, ravenclaw, hufflepuff]
	var indiceProximaCasa = 0
	
	method determinarCasa(estudiante) {
		var casa = casas.get(indiceProximaCasa)
		estudiante.casa(casa)
		casa.integrantes().add(estudiante)
		
		if (indiceProximaCasa == 3) indiceProximaCasa = 0
		else indiceProximaCasa += 1
	}
	
	override method cambiarAceite() { }
}

class Estudiante inherits Bot {
	var property casa
	const property hechizosAprendidos
	
	method estaActivo() = cargaElectrica > 0
	
	method lanzar(hechizo, objetivo) {
		if (self.estaActivo() && hechizosAprendidos.contains(hechizo)){
			hechizo.lanzar(self, objetivo)
		}
			
	}
	
	method esExperimentado() = hechizosAprendidos.size() > 3 && cargaElectrica > 50
}

class Profesor inherits Estudiante {
	const materiasDictadas
	
	override method esExperimentado() = super() && materiasDictadas >= 2
	
	override method disminuirCargaElectrica(cantidad) { }
	
	override method anularCargaElectrica() {
		cargaElectrica /= 2
	}
}

class Materia {
	const profesor
	const hechizoQueEnsenia
	
	method darClase(estudiantes) {
		estudiantes.forEach({e => e.hechizosAprendidos().add(hechizoQueEnsenia)})
	}
}