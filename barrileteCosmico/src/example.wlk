/** First Wollok example */
import usuarios.*
object barrileteCosmico {
	var destinos = #{}
	var usuarios = #{}
	
	
	method usuarios(){
		return usuarios
	}
	
	method destinos()
	{
		return destinos
	}
	
	method agregarUser(userName){
		usuarios.add(userName)
	}
	
	method quitarUser(userName){
		usuarios.remove(userName)
	}
	
	method destinosImportantes(){
		return destinos.filter({destino => destino.destacado()})
	}
	
	method aplicarDescuento(porcentaje){
		destinos.forEach({destino => 
			destino.descuento(porcentaje)
		})
	}
	
	method esExtrema(){
		return self.destinosImportantes().any({unDestino => unDestino.esPeligroso()})
	}
	
	method nombresDeDestinos(){
		return destinos.map({destino => destino.nombre()});
	}
	
	method agregarDestinos(nuevoDestino){
		destinos.add(nuevoDestino)
	}
}

class Localidad{
	var property equipaje = []
	var precio 
	var property nombre 
	var property kilometraje
	
	constructor (equipaje_,precio_, nombre_, kilometraje_){
		equipaje = equipaje_
		precio = precio_
		nombre = nombre_
		kilometraje = kilometraje_
	}
	
	method precio(){
		return precio
	}
	
	method destacado(){
		return precio>2000
	}
	method agregarAlEquipaje(elemento){
		equipaje.add(elemento)
	}
	
	method descuento(porcentaje){
		var aux = porcentaje/100
		precio = precio - (aux*precio)
		self.agregarAlEquipaje("Certificado de descuento")
	}
	
	method esPeligroso(){
		return equipaje.any({unEquipaje => unEquipaje.contains("Vacuna")})
	}
	
	method distanciaHasta(ciudad){
		return calculadoraDeDistancia.distancia(self,ciudad)
	}
}


object calculadoraDeDistancia{	
	method distancia(ciudadA,ciudadB){
		return (ciudadA.kilometraje() - ciudadB.kilometraje()).abs()
	}
}


class MedioDeTransporte{
	
	var property tiempoDeViaje
	var property precioPorKM
	constructor(_tiempoDeViaje,_precioPorKM)
	{
		tiempoDeViaje = _tiempoDeViaje
		precioPorKM = _precioPorKM
	}
	
	method tiempo(kilometros){
		return kilometros*tiempoDeViaje
	}
	
	method precio(ciudadA,ciudadB){
		var kilometros = calculadoraDeDistancia.distancia(ciudadA,ciudadB)
		return kilometros*precioPorKM	
	}
}
