import remeras.*
import pedidos.*
import sucursales.*

object ventaRemeras {
	
	var property sucursales
	var property pedidos =[]
	
	method registrarPedido(pedido){
		pedido.sucursal().pedidos().add(pedido)
		pedidos.add(pedido)
	}
	method totalFacturadoDe(sucursal){
		return sucursal.montoFacturado()
	}
	method totalFacturado(){
		return sucursales.sum({sucursal=>sucursal.montoFacturado()})
	}
	
	method pedidosDe(color){
		return pedidos.count({pedido=>pedido.modeloRemera().color()==color})
	}
	method pedidoMasCaroDeTodos(){
		return pedidos.max({pedido=>pedido.precioPedido()})	
	}
	method talleSinPedidos(rango){
		//return pedidos.map({pedido=>pedido.modeloRemera().talle()})
		//no supe manipular el rango
	}
	method mejorSucursal(){
		return sucursales.max({sucu=>sucu.montoFacturado()})
	}
	method laQueVendioTodosLosTalles(){
		//lo mismo que el talle sin pedidos
	}
	
}
