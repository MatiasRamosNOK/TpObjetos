/** First Wollok example */
import usuarios.*
object barrileteCosmico {
	var destinos = #{}
	var usuarios = #{}
	var mediosDeTransporte = #{}
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
	
	method nuevoViaje(usuario,localidadDestino)
	{
		usuario.haceUnViaje(new Viaje(usuario.ciudadOrigen(),localidadDestino,mediosDeTransporte.anyOne()))
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

class Viaje{
	
	var property origen
	var property destino
	var property transporte
	
	constructor(origen_,destino_,transporte_)
	{
		origen = origen_
		destino = destino_
		transporte = transporte_
	}
	
	method distanciaDeViaje(){
		return origen.distanciaHasta(destino)
	}
	
	method costoDeViaje(){
		return self.distanciaDeViaje() * transporte.precioPorKM()
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

}
