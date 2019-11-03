import barrileteCosmico.*

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

class Playas inherits Localidad{
	
	
	override method esPeligroso(){
		return false;
	}
	
	override method destacado(){
		return true
	}
	
}

class Montanias inherits Localidad{
	
	var property altura;
	
	override method esPeligroso(){
		return altura>5000 and super();
	}
	

}

class CiudadHistorica inherits Localidad{
	
	var contadorDeMuseos = 0
	
	method agregarMuseo(){ 
		contadorDeMuseos += 1
	}
	
	override method esPeligroso(){
		return equipaje.contains("AsistenciaDeViajero")
	}
	
	override method destacado(){
		return contadorDeMuseos>3
	}
}
