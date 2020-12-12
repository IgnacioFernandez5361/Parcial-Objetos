object islaPajaro{
	const property pajaros = #{}
	
	method pajarosFuertes() = pajaros.filter({pajaro => pajaro.esFuerte()})
	
	method fuerzaDeLaIsla() = self.pajarosFuertes().sumaDeFuerzasDePajaros()
	
	method sumaDeFuerzasDePajaros(unosPajaros) = unosPajaros.sum({pajaro => pajaro.conocerFuerza()}) 
	
	method atacarALaIslaCerdito(){
		const pajaroElejido = pajaros.anyOne()
		const objetivoADerribar = islaCerdito.obstaculoMasCercano()
		if(pajaroElejido.puedeDerribarUnObstaculo(objetivoADerribar)){
			islaCerdito.obstaculoDerribado(objetivoADerribar)
		}
	}
	
	method seRecuperaronLosHuevos() = islaCerdito.noTieneObstaculos()
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
	
	method puedeDerribarUnObstaculo(obstaculo) = self.conocerFuerza() > obstaculo.resistencia() 
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
		islaPajaro.pajaros().forEach({pajaro => pajaro.tranquilizarse()})
	}
}

class InvasionDeCerditos inherits Evento{
	
	const cantidadDeCerditosQueInvaden
	
	override method ocurrirEvento(){
		cantidadDeCerditosQueInvaden.times(islaPajaro.pajaros().forEach({pajaro => pajaro.enojarse()}))
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

object islaCerdito{
	const property obstaculos = #{}
	
	method obstaculoMasCercano() = return obstaculos.first()
	
	method obstaculoDerribado(unObstaculo){
		obstaculos.remove(unObstaculo)
	}
	
	method noTieneObstaculos() = obstaculos.isEmpty()
}

class Obstaculo{
	
	method resistencia()
}

class Pared inherits Obstaculo{
	const ancho
	
	override method resistencia() = ancho 
}

class ParedDeVidrio inherits Pared{
	override method resistencia() = super() * 10
}

class ParedDeMadera inherits Pared{
	override method resistencia() = super() * 25
}

class ParedDePiedra inherits Pared{
	override method resistencia() = super() * 50
}

object cerditoObrero inherits Obstaculo{
	override method resistencia() =  50
}

class CerditoArmado inherits Obstaculo{
	override method resistencia() =  10
}

class CerditoConEscudo inherits CerditoArmado{
	const resistenciaEscudo
	
	override method resistencia() =  super() * resistenciaEscudo
}

class CerditoConCasco inherits CerditoArmado{
	const resistenciaCasco
	
	override method resistencia() =  super() * resistenciaCasco
}


