

class Persona {
	const suenios = []
	var felicidonios = 0
	
	var cantidadDeHijos = 0
	
	const carrerasAEstudiar = []
	const carrerasCompletadas = []
	
	const lugaresVisitados = []
	
	const salarioSoniado
	
	method cumplirSuenio(suenio){
		if(suenios.sueniosPedientes().contains()){
				self.error("El sueño " + suenio + " no está pendiente")
		}
		suenio.cumplir(self)
	}
	
	method sueniosPendientes() = suenios.filter { suenio => suenio.estaPendiente() }

	method tieneHijos(){
		return cantidadDeHijos > 0
	}
	
	method agregarHijos(cantidadAAgregar){
		cantidadDeHijos += cantidadAAgregar
	}
	
	method viajarA(lugar){
		lugaresVisitados.add(lugar)
	}
	
	method aceptaSalario(salario){
		return salario >= salarioSoniado
	}
	
	method quiereRecibirseDeEstaCarrera(carrera){
		return carrerasAEstudiar.contains(carrera)
	}
	
	method seRecibio(carrera){
		return carrerasCompletadas.contains(carrera)
	}
	
}

class Suenio {
	var cumplido = false
	var felicidonios = 0
	
	method estaPendiente(){
		return !cumplido
	}
	
	method cumplir(persona){
		cumplido = true
	} 
}

class AdoptarHijo inherits Suenio{
	const hijosAAdoptar
	
	method validar(persona){
		if(persona.tieneHijos()){
			persona.error("No se puede adoptar si se tiene un hijo")
		}
	}
	
	method realizar(persona){
		persona.agregarHijos(hijosAAdoptar)
	}
}

class Viajar inherits Suenio {
	const lugar
	
	method validar(persona){
		
	}
	
	method realizar(persona){
		persona.viajarA(lugar)
	}
}

object tenerHijo inherits Suenio {
	
	method validar(persona){
		
	}
	
	method realizar(persona){
		persona.agregarHijos(1)
	}
}

class ConseguirTrabajo inherits Suenio{
	const salarioOfrecido
	
	method validar(persona){
		if(persona.aceptaSalario(salarioOfrecido)){
			
		}
	}
	
	method realizar(persona){
		
	}
}

class Recibirse inherits Suenio {
	const carrera
	
	method validar(persona){
		if(persona.seRecibio(carrera)){
			throw new Exception(message = "No se puede recibir dos veces de una misma carrera")
		}
		if(persona.quiereRecibirseDeEstaCarrera(carrera)){
			throw new Exception(message = "No se puede recibir de una carrera que no quiere")
		}
	}
}

