import remeras.*
import pedidos.*

class Sucursales{
	var property pedidos
	var property cantMinimaParaDescuento
	
	method montoFacturado(){
		return pedidos.sum({pedido=>pedido.precioPedido()})
	}
	method cantPedidosDe(color){
		return pedidos.count({pedido=>pedido.color()==color})
	}
	method pedidoMasCaro(){
		return pedidos.max({pedido=>pedido.precioPedido()})
	}
}
