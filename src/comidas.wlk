class Plato {
	var property peso = 0
	var property esAptoVegetariano = false
	var property valoracion = 0
	
	method esAbundante(){ return peso > 250}
	
	
}



class Provoleta inherits Plato{
	var property tieneEspecias
	
	override method esAptoVegetariano(){
		if (not tieneEspecias) {return false}
		else{return true}
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



class Pan{
	var property valoracion=0
	
}

class Industrial inherits Pan{
	
}

class Casero  inherits Pan{
	
}

class MasaMadre inherits Pan{
	
}


class HamburguesaVegetariana inherits Plato{
	
	const pan 
	var property legumbre 
	
	override method esAptoVegetariano(){return true}
	
	override method valoracion() {return 17.min(2 * legumbre.size()) + 60 + pan.valoracion()
		
	}
	
}


class Parrillada inherits Plato{

	const cortes = []
	
	method agregarCorte(unCorte) = cortes.add(unCorte)
	
	override method peso(){return cortes.sum({c=> c.peso()})}
	
	override method valoracion(){
		return (0.max(15 * cortes.max({c => c.calidad()}).calidad()) - cortes.size())
		
	}
	
}


class Cortes inherits Parrillada{
	var property nombre 
	var property calidad = 0
}




