import example.*

class UserException inherits Exception { }

class Usuario{

	var viajes = []
	var saldo 
	var sigueA = #{}
	var property ciudad
	var property metodoDeTransporte
	var kilometrosRecorridos = 0
	constructor(viajes_,saldo_,sigueA_,ciudad_,metodoDeTransporte_){
		viajes = viajes_
		saldo = saldo_
		sigueA = sigueA_
		ciudad = ciudad_
		metodoDeTransporte = metodoDeTransporte_
	}
	method conoceDestinos(){
		return viajes
	}
	
	method saldo(){
		return saldo
	}
	
	method kilometrosRecorridos(){
		return kilometrosRecorridos
	}
	
	method agregarDestino(unDestino){
		viajes.add(unDestino)
	}
	
	method puedeViajarA(unDestino){
		return (saldo - unDestino.precio() - metodoDeTransporte.precio(ciudad,unDestino)) >= 0
	}
	
	method pagarViajeA(unDestino){
		saldo -= unDestino.precio()
	}
	
	method viajarA(unDestino){
		if(self.puedeViajarA(unDestino)){
			kilometrosRecorridos += self.distanciaAlDestino(unDestino)
			self.agregarDestino(unDestino)
			self.pagarViajeA(unDestino)
			self.ciudad(unDestino)
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
		return (unaCiudad.kilometraje() - ciudad.kilometraje()).abs()
	}
}