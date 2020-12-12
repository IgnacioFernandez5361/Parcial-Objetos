object isla{
	const property pajaros = #{}
	
	method pajarosFuertes() = pajaros.filter({pajaro => pajaro.esFuerte()})
	
	method fuerzaDeLaIsla() = self.pajarosFuertes().sumaDeFuerzasDePajaros()
	
	method sumaDeFuerzasDePajaros(unosPajaros) = unosPajaros.sum({pajaro => pajaro.conocerFuerza()}) 
}

class Pajaro {
	var ira 
	var vecesQueSeEnojo = 0
	
	method conocerFuerza()
	
	method iraDuplicada(){
		return ira *2
	}
	
	method enojarse(){
		ira *= 2
		vecesQueSeEnojo++
	}
	
	method esFuerte() = self.conocerFuerza() > 50
	
	method tranquilizarse(){
		ira -= 5
	}
}

class PajaroComun inherits Pajaro{
	
	override method conocerFuerza() = self.iraDuplicada()
}

class PajaroRencoroso inherits Pajaro{
	override method conocerFuerza(){
		return ira * vecesQueSeEnojo
	}
}

object red inherits PajaroRencoroso{
	
	override method conocerFuerza() = super() * 10
}

object bomb inherits Pajaro{
	var topeMaximoDeFuerza = 9000
	
	method topeMaximoDeFuerza(unTope){
		topeMaximoDeFuerza = unTope
	}
	
	override method conocerFuerza() = self.iraDuplicada().min(topeMaximoDeFuerza)
}

object chuck inherits Pajaro{
	var velocidad
	
	override method conocerFuerza(){
		if(velocidad<=80){
			return 150
		}
		else{
			const velocidadDeMas = velocidad - 80
			return 150 + velocidadDeMas* 5
		}
	}
	
	override method enojarse(){
		super()
		velocidad *= 2
	}
	
	override method tranquilizarse(){}
}

object terence inherits PajaroRencoroso{
	
	const multiplicadorDeIra
	
	override method conocerFuerza() = super() * multiplicadorDeIra
}

object matilda inherits Pajaro{
	var huevos 
	
	override method conocerFuerza(){
		return self.iraDuplicada() + self.fuerzaDeHuevos()
	}
	
	method fuerzaDeHuevos() = huevos.sum({huevo => huevo.peso()})
	
	override method enojarse(){
		super()
		huevos.add(new Huevo (peso=2))
	}
	
}

class Huevo{
	const property peso
}

class Evento{
	method ocurrirEvento()
}

object sesionDeManejoDeIra inherits Evento{
	
	override method ocurrirEvento(){
		isla.pajaros().forEach({pajaro => pajaro.tranquilizarse()})
	}
}

class InvasionDeCerditos inherits Evento{
	
	const cantidadDeCerditosQueInvaden
	
	override method ocurrirEvento(){
		cantidadDeCerditosQueInvaden.times(isla.pajaros().forEach({pajaro => pajaro.enojarse()}))
	}
}

class FiestaSorpresa inherits Evento{
	
	const homenajeados = #{}
	
	override method ocurrirEvento(){
		homenajeados.forEach({homenajeado => homenajeado.enojarse()})
	}
}

class SerieDeEventosDesafortunados inherits Evento{
	
	const eventos = #{}
	
	override method ocurrirEvento(){
		eventos.forEach({evento => evento.ocurrirEvento()})
	}
}












