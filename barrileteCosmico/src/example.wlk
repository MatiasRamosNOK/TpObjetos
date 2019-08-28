/** First Wollok example */
object barrileteCosmico {
	var destinos = #{garlicSea,silverSea,lastToninas,goodAirs}
	
	
	method destinosImportantes(){
		return destinos.filter({destino => destino.destacado()})
	}
	
	method aplicarDescuento(porcentaje){
		destinos.forEach({destino => 
			destino.descuento(porcentaje)
			destino.agregarAlEquipaje("Certificado de descuento")
		})
	}
	
	method esExtrema(){
		return (destinos.any({destino=> destino.equipaje().constains("Vacuna")}))
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
	}
	method destacado(){
		return precio>2000
	}
	method agregarAlEquipaje(elemento){
		equipaje.add(elemento)
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
	}
}
