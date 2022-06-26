/*
 1) La mejor opción para manejar el peso en las comidas era la siguiente:
. método abstracto peso en Plato
. const property peso en Provoleta
. en esAbundante() usar self.peso()

2) valoración() debía ser un método abstracto, (no era un atributo)
* 
3) esAptoVegetariano() debía ser un métod abstracto, (no era un atributo)
* 
4) Incorrecto uso de los booleando en  esAptoVegetariano de Provoleta
* 
6) Los panes debía ser objetos con nombre propio en lugar de clases 
* y además no tendría sentido armar clases que no hacen nada y además debia ser un valor fijo no configurable
* 
7) La hamburguesa Vegerariana herada de Hamburguesa de Carne
* 
8) Corte no debía heredar de parrillada
 */

class Plato {
	
	method peso()
	method esAptoVegetariano()
	method valoracion()
	
	
	method esAbundante(){ return self.peso() > 250}
	
	
}



class Provoleta inherits Plato{
	var property tieneEspecias
	const property peso	
	override method esAptoVegetariano(){
		return not tieneEspecias 
	}
	
	
	method esEspecial(){ return self.esAbundante() or tieneEspecias}
	
	override method valoracion()= if(self.esEspecial()){
		120
	}else{
		80
	}
}


class HamburguesaDeCarne inherits Plato{
	const pan 
	
	override method peso(){return 250}	
	
	override method esAptoVegetariano(){return false}
	
	override method valoracion() {return 60 + pan.valoracion()}
	
}




object industrial {
	method valoracion() = 0
}

object casero  {
	method valoracion() = 20
	
}

object masaMadre {
	method valoracion()= 45
}


class HamburguesaVegetariana inherits HamburguesaDeCarne{
	
	
	var property legumbre 
	
	
	override method esAptoVegetariano(){return true}
	
	override method valoracion() {return 17.min(2 * legumbre.size()) + 60 + pan.valoracion()
		
	}
	
}


class Parrillada inherits Plato{

	const cortes = []
	
	method agregarCorte(unCorte) = cortes.add(unCorte)
	
	override method esAptoVegetariano(){return false}
	
	override method peso(){return cortes.sum( {c=> c.peso() })}
	
	override method valoracion(){
		return (0.max(15 * cortes.max({c => c.calidad()}).calidad()) - cortes.size())
		
	}
	
}


class Cortes {
	var property nombre 
	var property calidad 
	var property peso =0
}




