import comidas.*
import comensales.*


class Cocina{
	const comidasDeParrilla = []
	
	method agregarACocina(unaComida) = comidasDeParrilla.add(unaComida)
	
	method comidasVegetarianas() = comidasDeParrilla.sum({c => c.esAptoVegetariano() })
	
	method comidasCarnivoras() = comidasDeParrilla.sum({c => not c.esAptoVegetariano() })
	
	method tieneOfertaVegetariana() = 
	self.comidasVegetarianas() - self.comidasCarnivoras() >= 2 
	or self.comidasCarnivoras() -self.comidasVegetarianas() >= 2 
	
	method platoFuerteCarnivoro(){comidasDeParrilla.filter({c => c.valoracion()}).max()}
	
	method comidasQueGustaElComensal(unComensal,unaComida) = unComensal.leAgrada(unaComida)
	
	
}


