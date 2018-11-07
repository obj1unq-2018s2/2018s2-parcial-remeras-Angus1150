import sucursales.*
import remeras.*

class Pedido {
	var property modeloRemera
	var property cantRemerasPedidas
	var property sucursal
	
	method precioBase(){
		return modeloRemera.costo()*cantRemerasPedidas
	}
	method aplicaDesc(){
		return sucursal.cantMinimaParaDescuento()<=cantRemerasPedidas
	}
	method porcentajeDesc(){
		return modeloRemera.descuentoPorCantidad()
	}
	
	method descuento(){
		if(self.aplicaDesc()){
		 return self.precioBase()*(self.porcentajeDesc()/100)
	    }else{
	    	return 0
	    } 
	}
	method precioPedido(){
		return self.precioBase()-self.descuento()
	}
}
