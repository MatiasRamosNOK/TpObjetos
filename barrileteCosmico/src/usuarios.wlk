import example.*

class UserException inherits Exception { }

class Usuario{

	var viajes = []
	var saldo 
	var sigueA = #{}
	var property ciudad
	constructor(viajes_,saldo_,sigueA_,ciudad_,metodoDeTransporte_){
		viajes = viajes_
		saldo = saldo_
		sigueA = sigueA_
		ciudad = ciudad_
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
		self.ciudad(unViaje.destino())
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
		return ciudad.distanciaHasta(unaCiudad)
	}
}