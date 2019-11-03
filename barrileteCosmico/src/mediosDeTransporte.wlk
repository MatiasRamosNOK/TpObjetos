

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
