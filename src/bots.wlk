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
}

class Estudiante inherits Bot {
	const casa
	const hechizosAprendidos
	
	method estaActivo() = cargaElectrica > 0
	
	method lanzar(hechizo, objetivo) {
		hechizo.lanzar(self, objetivo)
	}
	
	method esExperimentado() = hechizosAprendidos.size() > 3 && cargaElectrica > 50
}

class Profesor inherits Estudiante {
	const materiasDictadas
	
	override method esExperimentado() = super() && materiasDictadas.size() >= 2
	
	override method disminuirCargaElectrica(cantidad) { }
	
	override method anularCargaElectrica() {
		cargaElectrica /= 2
	}
}

