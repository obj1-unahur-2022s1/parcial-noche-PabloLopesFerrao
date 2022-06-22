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
		super() and not comidas.all({c => c.esAbundante()})
	}
	
}

class HambrePopular inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.esAbundante()
	
}


class PaladarFino inherits Comensales{
	
	override method leAgrada(unaComida) = 
	unaComida.peso() >= 150 and unaComida.peso() <= 300 and unaComida.valoracion() > 100
	
	override method estaSatisfecho(){ return
		super() and (comidas.size() %2  == 0)
	}
	
}



