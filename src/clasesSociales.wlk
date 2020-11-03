import vikingos.*


class Casta {
	method puedeIr(vikingo) = true
}

object jarl inherits Casta {
	
	override method puedeIr(vikingo) = not vikingo.tieneArmas()

	method ascensoSocial(vikingo){
		vikingo.recompensas()
		vikingo.claseSocial(karl)
	}
}

object karl inherits Casta {
	method ascensoSocial(vikingo){
		vikingo.claseSocial(thrall)
	}
}

object thrall inherits Casta {
	method ascensoSocial(vikingo){}
}