import example.*

class Usuario{

	var viajes = []
	var saldo = 1500
	var sigueA = #{}
	var property ciudad
	var property metodoDeTransporte
	var kilometrosRecorridos = 0
	
	method conoceDestinos(){
		return viajes
	}
	
	method saldo(){
		return saldo
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
			self.agregarDestino(unDestino)
			self.pagarViajeA(unDestino)
			self.ciudad(unDestino)
			kilometrosRecorridos += (calculadoraDeDistancia.distancia(ciudad,unDestino))
		}
	}
	
	method kilometrosDisponibles(){
		return viajes.sum({unDestino => unDestino.precio()}) * 0.1
	}
	
	method seguirA(unUsuario){
		sigueA.add(unUsuario)
	}
	
	method seguirUsuario(unUsuario){
		unUsuario.seguirA(self)
		self.seguirA(unUsuario)
	}
}