import vikingos.*

class Expedicion {
	var destinos
	var vikingos
	
	method numeroDeVikingos(){
		return vikingos.size()
	}
	
	method valeLaPena(){
		return destinos.all({destino => destino.valeLaPena(self)})
	}
	
	method subirAUnVikingo(vikingo){
		if(vikingo.puedeSubirAUnaExpedicion()){
			vikingos.add(vikingo)
		}
		else{
			throw noPuedeSubirAExpedicion		
		}
	}
	
	method realizarExpedicion(){
		const oroPorVikingo = self.monedasDeOroConseguidas().div(self.numeroDeVikingos())
		vikingos.forEach({vikingo => vikingo.sumarMonedas(oroPorVikingo)})
	}
	
	method monedasDeOroConseguidas(){
		return destinos.map({destino => destino.monedasDeOro()}).sum()
	}
}

class Destino {
	
	method valeLaPena(expedicion)
	
	method monedasDeOro(expedicion)
}

class Capital inherits Destino{
	const riquezaDeLaTierra
	
	override method valeLaPena(expedicion){
		return self.monedasDeOro(expedicion) >= expedicion.numeroDeVikingos() * 3
	}
	
	override method monedasDeOro(expedicion){
		return expedicion.numeroDeVikingos() * riquezaDeLaTierra
	}
}

class Aldea inherits Destino {
	const cantidadDeCrucifijos
	
	override method valeLaPena(expedicion){
		return self.monedasDeOro(expedicion) >= 15 
	}
	
	override method monedasDeOro(expedicion){
		return cantidadDeCrucifijos
	}
}

class AldeaAmurallada inherits Aldea {
	const vikingosNecesarios
	
	override method valeLaPena(expedicion){
		return expedicion.numeroDeVikingos() >= vikingosNecesarios
	}
}

object noPuedeSubirAExpedicion inherits Exception {}
