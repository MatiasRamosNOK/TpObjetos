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