import clasesSociales.*

class Vikingo {
	var armas 
	var cantidadDeHijos
	var hectareas
	var vidasCobradas
	var property claseSocial
	const oficio
	var monedasDeOro = 0
	
	method puedeSubirAUnaExpedicion(){
		return oficio.esProductivo(self) && claseSocial.puedeIr(self)
	}
	
	method tieneArmas(){
		return armas > 0
	}
	
	method sumarMonedas(nuevasMonedas){
		monedasDeOro += nuevasMonedas
	}
	
	method escalar(){
		claseSocial.ascensoSocial(self)
	}
	
	method recompensas()
}

object soldado inherits Vikingo {
	
	method esProductivo(vikingo){
		return vidasCobradas > 20 && vikingo.tieneArmas()
	}
	
	override method recompensas(){
		armas  += 10
	}
}

object granjero inherits Vikingo {
	
	method esProductivo(vikingo){
		return hectareas >= 2*cantidadDeHijos
	}
	
	override method recompensas(){
		cantidadDeHijos += 2
		hectareas += 2
	}
}