/** First Wollok example */
object barrileteCosmico {
	var destinos = #{garlicSea,silverSea,lastToninas,goodAirs}
	
	
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
	
	method destinos(){
		return destinos
	}
}

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

object pHairi {
	
	var conoceDestinos = [lastToninas, goodAirs]
	var saldo = 1500
	var sigueA = #{}
	
	method conoceDestinos(){
		return conoceDestinos
	}
	
	method saldo(){
		return saldo
	}
	
	method agregarDestino(unDestino){
		conoceDestinos.add(unDestino)
	}
	
	method puedeViajarA(unDestino){
		return (saldo - unDestino.precio()) >= 0
	}
	
	method pagarViajeA(unDestino){
		saldo -= unDestino.precio()
	}
	
	method viajarA(unDestino){
		if(self.puedeViajarA(unDestino)){
			self.agregarDestino(unDestino)
			self.pagarViajeA(unDestino)
		}
	}
	
	method kilometrosDisponibles(){
		return conoceDestinos.sum({unDestino => unDestino.precio()}) * 0.1
	}
	
	method seguirA(unUsuario){
		sigueA.add(unUsuario)
	}
	
	method seguirUsuario(unUsuario){
		unUsuario.seguirA(self)
		self.seguirA(unUsuario)
	}
}

object otroUser {
	var conoceDestinos = []
	var saldo = 5000
	var sigueA = #{}
	
	method conoceDestinos(){
		return conoceDestinos
	}
	
	method saldo(){
		return saldo
	}
	
	method agregarDestino(unDestino){
		conoceDestinos.add(unDestino)
	}
	
	method puedeViajarA(unDestino){
		return (saldo - unDestino.precio()) >= 0
	}
	
	method pagarViajeA(unDestino){
		saldo -= unDestino.precio()
	}
	
	method viajarA(unDestino){
		if(self.puedeViajarA(unDestino)){
			self.agregarDestino(unDestino)
			self.pagarViajeA(unDestino)
		}
	}
	
	method kilometrosDisponibles(){
		return conoceDestinos.sum({unDestino => unDestino.precio()}) * 0.1
	}
	
	method seguirA(unUsuario){
		sigueA.add(unUsuario)
	}
	
	method seguirUsuario(unUsuario){
		unUsuario.seguirA(self)
		self.seguirA(unUsuario)
	}
}