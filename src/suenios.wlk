
class Persona {
	const suenios = []
	var felicidonios = 0
	
	var cantidadDeHijos = 0
	
	const carrerasAEstudiar = []
	const carrerasCompletadas = []
	
	const lugaresVisitados = []
	
	const salarioSoniado
	
	method cumplirSuenio(suenio){
		if(!suenios.sueniosPendientes().contains(suenio)){
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
	
	method completarCarrera(carrera){
		carrerasCompletadas.add(carrera)
	}
	
	method sumarFelicidonios(felicidoniosNuevos){
		felicidonios += felicidoniosNuevos
	}
	
	method suenioMultiple(suenioMultiple){
			
	}
}

class Suenio {
	var cumplido = false
	var felicidonios = 0
	
	method estaPendiente(){
		return !cumplido
	}
	
	method validar(persona)
	
	method realizar(persona)
	
	method cumplir(persona){
		self.validar(persona)
		self.realizar(persona)
		self.cumplir()
		persona.sumarFelicidonios(felicidonios)
	}
	
	method cumplir(){
		cumplido = true
	} 
}

class AdoptarHijo inherits Suenio{
	const hijosAAdoptar
	
	override method validar(persona){
		if(persona.tieneHijos()){
			persona.error("No se puede adoptar si se tiene un hijo")
		}
	}
	
	override method realizar(persona){
		persona.agregarHijos(hijosAAdoptar)
	}
}

class Viajar inherits Suenio {
	const lugar
	
	override method validar(persona){
		
	}
	
	override method realizar(persona){
		persona.viajarA(lugar)
	}
}

object tenerHijo inherits Suenio {
	
	override method validar(persona){
		
	}
	
	override method realizar(persona){
		persona.agregarHijos(1)
	}
}

class ConseguirTrabajo inherits Suenio{
	const salarioOfrecido
	
	override method validar(persona){
		if(persona.aceptaSalario(salarioOfrecido)){
			
		}
	}
	
	override method realizar(persona){
		
	}
}

class Recibirse inherits Suenio {
	const carrera
	
	override method validar(persona){
		if(persona.seRecibio(carrera)){
			throw new Exception(message = "No se puede recibir dos veces de una misma carrera")
		}
		if(!persona.quiereRecibirseDeEstaCarrera(carrera)){
			throw new Exception(message = "No se puede recibir de una carrera que no quiere")
		}
	}
	
	override method realizar(persona){
		persona.completarCarrera(carrera)
	}
}

