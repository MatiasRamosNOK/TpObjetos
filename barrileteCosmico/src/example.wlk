/** First Wollok example */
import usuarios.*
object barrileteCosmico {
	var destinos = #{}
	var usuarios = #{}
	var property mediosDeTransporte = #{}
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
		usuario.haceUnViaje(new Viaje(usuario.ciudadOrigen(),localidadDestino,usuario.metodoDeTransporte()))
	}
	
	method transporteEmpresario(){
		return self.mediosDeTransporte().min({transporte => transporte.tiempoDeViaje()})
	}
	
	method transporteEstudiantil(unUsuario){
			return self.mediosDeTransporte().filter({transporte => transporte.precioPorKM()<unUsuario.saldo()}).min({unTransporte => unTransporte.tiempoDeViaje()})
	}
	
	method transporteGrupoFamiliar(){
		return self.mediosDeTransporte().anyOne()
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


class Avion{
	var property tiempoDeViaje
	var property turbinas = []
	constructor(_tiempoDeViaje)
	{
		tiempoDeViaje = _tiempoDeViaje
	}
	
	method agregarTurbina(valorImpulso){
		turbinas.add(valorImpulso)
	}
	
	method precioPorKM(){
		return turbinas.sum()
	}
}


class Micro{
	var property tiempoDeViaje
	var property precioPorKM = 5000
	constructor(_tiempoDeViaje)
	{
		tiempoDeViaje = _tiempoDeViaje
	}
}

class Tren{
	var property tiempoDeViaje
	var property precioPorKM = 1000 * 1.6 //1 Milla = 1.6 KM
	constructor(_tiempoDeViaje)
	{
		tiempoDeViaje = _tiempoDeViaje
	}
}

class Barco{
	var property tiempoDeViaje
	var property probabilidadDeChoqueConIceberg
	constructor(_tiempoDeViaje, _probabilidadDeChoqueConIceberg)
	{
		tiempoDeViaje = _tiempoDeViaje
		probabilidadDeChoqueConIceberg = _probabilidadDeChoqueConIceberg
	}
	
	method precioPorKM()
	{
		return 1000*probabilidadDeChoqueConIceberg
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


/* como heredar constructor dentro de un constructor

class A {
	var property nombre
	
	constructor(unNombre){
		nombre = unNombre
	}
}

class B inherits A {
	var property edad
	
	constructor(unNombre, unaEdad) = super(unNombre){
		edad = unaEdad
	}
}
*/