import pedidos.*
import sucursales.*


class Remera {
	var property talle
	var property color
	method costo()=  0
}
class RemeraLisa inherits Remera{
	
	method esColorBase(){
		return color == "blanco" or color == "negro" or color== "gris"
	}
	method costoTalleChico(){
		if( self.esColorBase()){
			return 80
		}else{
			return 88
		}
	}
	method costoTalleGrande(){
		if (self.esColorBase()){
			return 100
		}else{
			return 110
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
		if(costoDibujoDeEmpresa>0 && tengoConvenioConEmpresa){
			return 20
		}else{
			return super()
		}
	}
	override method costo(){
		return super()+self.costoSublimado()
	}
	
}