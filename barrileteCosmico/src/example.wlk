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
	
	var property factorTiempo
	var property factorCosto
	constructor(factorTiempo_,factorCosto_)
	{
		factorTiempo = factorTiempo_
		factorCosto = factorCosto_
	}
	
	method tiempo(kilometros){
		return kilometros*factorTiempo
	}
	
	method precio(ciudadA,ciudadB){
		var kilometros = calculadoraDeDistancia.distancia(ciudadA,ciudadB)
		return kilometros*factorCosto	
	}
}
/** Aca creo una clase destino, todos los demas destinos se pueden instanciar por consola, por el momento los dejo comentados */
/** Tambien creo la clase usuario con lo cual elimino a pHairi */
/** 
object garlicSea{
	var equipaje = ["Caña de pescar","Piloto"]
	var precio = 2500
	
	method nombre(){
		return "Garlic Sea"
	}
	
	method equipaje(){
		return equipaje
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
}

object silverSea{
	var equipaje = ["Protector Solar","Equipo de Buceo"]
	var precio = 1350
	
	method nombre(){
		return "Silver Sea"
	}
	
	method equipaje(){
		return equipaje
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
}

object lastToninas{
	var equipaje = ["Vacuna Gripal","Vacuna B","Necronomicon"]
	var precio = 3500
	
	method nombre(){
		return "Last Toninas"
	}
	method equipaje(){
		return equipaje
	}
	
	method precio(){
		return precio
	}
	
	method descuento(porcentaje){
		var aux = porcentaje/100
		precio = precio - (aux*precio)
		self.agregarAlEquipaje("Certificado de descuento")
	}
	method destacado(){
		return precio>2000
	}
	method agregarAlEquipaje(elemento){
		equipaje.add(elemento)
	}
	method esPeligroso(){
		return equipaje.any({unEquipaje => unEquipaje.contains("Vacuna")})
	}
}

object goodAirs{
	var equipaje = ["Cerveza","Protector Solar"]
	var precio = 1500
	
	method nombre(){
		return "Good Airs"
	}
	
	method equipaje(){
		return equipaje
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
}

*/

