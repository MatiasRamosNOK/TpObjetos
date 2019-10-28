import example.*

class UserException inherits Exception { }

class Usuario{
	var property tipoDeUsuario
	var viajes = []
	var saldo 
	var sigueA = #{}
	var property asistenciaViajero;
	var property ciudadOrigen
	constructor(viajes_,saldo_,sigueA_,ciudadOrigen_,_tipoDeUsuario){
		viajes = viajes_
		saldo = saldo_
		sigueA = sigueA_
		ciudadOrigen = ciudadOrigen_
		tipoDeUsuario = _tipoDeUsuario
	}
	method conoceViajes(){
		return viajes
	}
	
	method saldo(){
		return saldo
	}
	
	method kilometrosRecorridos(){
		return viajes.sum({viaje => viaje.distanciaDeViaje()})
	}
	
	method agregarViaje(unDestino){
		viajes.add(unDestino)
	}
	
	method puedePagarElViaje(unViaje){
		return (saldo - unViaje.costoDeViaje()) >= 0
	}
	
	method pagarViajeA(unViaje){
		saldo -= unViaje.costoDeViaje()
	}
	
	method nuevaCiudadDeOrigenPorViaje(unViaje){
		self.ciudadOrigen(unViaje.destino())
	}
	

	method haceUnViaje(unViaje){
		if(self.puedePagarElViaje(unViaje)){
			self.agregarViaje(unViaje)
			self.pagarViajeA(unViaje)
			self.nuevaCiudadDeOrigenPorViaje(unViaje)
		}else{
			throw new UserException(message = "No puede viajar,no posee suficiente saldo")
		}
	}
		
	method seguirA(unUsuario){
		sigueA.add(unUsuario)
	}
	
	method seguirUsuario(unUsuario){
		unUsuario.seguirA(self)
		self.seguirA(unUsuario)
	}
	
	method distanciaAlDestino(unaCiudad){
		return calculadoraDeDistancia.distancia(ciudadOrigen,unaCiudad)
	}
	

	method metodoDeTransporte(){
		return tipoDeUsuario.elegirMetodoDeTransporte(self)
	}
}

// delegar l0s siguientes 3 metodos a barrilete cosmico

object usuarioEmpresario {
	method elegirMetodoDeTransporte(unUsuario){
		return barrileteCosmico.mediosDeTransporte().min({transporte => transporte.tiempoDeViaje()})
	}
}

object usuarioEstudiantil {
	method elegirMetodoDeTransporte(unUsuario){
		return barrileteCosmico.mediosDeTransporte().filter({transporte => transporte.precioPorKM()<unUsuario.saldo()}).min({unTransporte => unTransporte.tiempoDeViaje()})
	}
}

object usuarioGrupoFamiliar {
	method elegirMetodoDeTransporte(unUsuario){
		return barrileteCosmico.mediosDeTransporte().anyOne()
	}

}