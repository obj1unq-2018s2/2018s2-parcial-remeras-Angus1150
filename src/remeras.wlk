import pedidos.*
import sucursales.*


class Remera {
	var property talle
	var property color
	method costo()=  0 // TODO Sería mejor el método abstracto.
}

class RemeraLisa inherits Remera{
	
	method esColorBase(){
		return color == "blanco" or color == "negro" or color== "gris" // TODO Los colores básicos podrían ser una colección.
	}
	method costoTalleChico(){
		if( self.esColorBase()){
			return 80
		}else{
			return 88 // TODO Deberías calcular este valor en lugar de hard-codearlo
		}
	}
	method costoTalleGrande(){
		if (self.esColorBase()){
			return 100
		}else{
			return 110// TODO Deberías calcular este valor en lugar de hard-codearlo
		}
	}
	method descuentoPorCantidad(){
		return 10
	}
	override method costo(){
		if(talle<41){
			return self.costoTalleChico()
		}else{
			return self.costoTalleGrande()
		}
	}
}
class RemeraBordada inherits RemeraLisa{
	var property cantColores
	method costoBordado(){
		if(cantColores<2){
			return 20
		}else{
			return 10*cantColores
		}
	}
	override method descuentoPorCantidad(){
		return 2
	}
	override method costo(){
		return super()+self.costoBordado()
	}
	
}
class RemeraSublimada inherits RemeraLisa{
	var property alto
	var property ancho
	var property costoDibujoDeEmpresa
	var property tengoConvenioConEmpresa
	
	method costoSublimado(){
		return 0.5*alto*ancho+costoDibujoDeEmpresa
	}
	override method descuentoPorCantidad(){
		if(costoDibujoDeEmpresa>0 && tengoConvenioConEmpresa){ // TODO Esto muestra un déficit de modelado, te falta un objeto/clase.
			return 20
		}else{
			return super()
		}
	}
	override method costo(){
		return super()+self.costoSublimado()
	}
	
}