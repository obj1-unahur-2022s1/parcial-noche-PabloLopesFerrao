/*
 * estaSatisfecho() de Vegetarianos te falto la negacion dentro del closure
 * Era conveniente usar el between dentro de leAgrada de PaladarFino
 * Recorda que podes unar el mensaje x.even() a un número para saber si es par en lugar de usar la funcion modulo de 2  (x % 2)
 */

import comidas.*

class Comensales {
	var property peso
	const comidas = []
	
	method leAgrada(unaComida) 
	
	method comer(unaComida) = comidas.add(unaComida)
	
	method estaSatisfecho(){return comidas.sum({c=>c.peso()}) > (peso /100)}
	
	
}

class Vegetarianos inherits Comensales{
	override method leAgrada(unaComida) = unaComida.esAptoVegetariano() and (unaComida.valoracion() > 85)
	
	override method estaSatisfecho(){ return
		super() and  comidas.all({c => not c.esAbundante()})
	}
	
}

class HambrePopular inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.esAbundante()
	
}


class PaladarFino inherits Comensales{
	
	override method leAgrada(unaComida) = 
	unaComida.peso().between(150, 300) and unaComida.valoracion() > 100
	
	override method estaSatisfecho(){ return
		super() and comidas.size().even()
	}
	
}



