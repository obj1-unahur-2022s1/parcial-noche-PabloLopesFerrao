/*
 * En tieneBuenaOfertaVegetariana() convenia usar el valor absoluto abs() sobre la resta, el lugar de hacer los dos cálculos
 * En  platoFuerteCarnivoro() esta mal. Debias filtar las comidas las comidas carnivoras y luego buscar el maximo de la valoriacion
 * comidasQueGustaElComensal no recibia una comida, debias buscar en las comidas de la Parrillada
 * No esta el bonus para sumar
 */

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
	
	method platoFuerteCarnivoro(){comidasDeParrilla.filter({c => not c.esAptoVegetariano()}).max({c => c.valoracion()})}
	
	method comidasQueGustaElComensal(unComensal,unaComida) = unComensal.leAgrada(unaComida)
	
	
}


