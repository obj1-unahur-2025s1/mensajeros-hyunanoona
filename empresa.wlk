import destinos.*
import mensajeros.*
import paquetes.*

object empresa{
  const listaDeMensajeros = []
  var facturacion = 0
  const paquetesPendientes = []
  method facturacionTotal(){
    return(
      facturacion
    )
  }
  method listaDeMensajeros(){
    return(
        listaDeMensajeros
    )
  }
  method contratarUnMensajero(unMensajero){
    listaDeMensajeros.add(unMensajero)
  }
  method despedirUnMensajero(unMensajero){
    listaDeMensajeros.remove(unMensajero)
  }
  method despedirTodosLosMensajeros(){
    listaDeMensajeros.clear()
   }
   method esGrande(){
    return(
      listaDeMensajeros.size() > 2
    )
  }
  method puedeSerEntregadoPorElPrimerEmpleado(unDestino){
    return(
      paquete.puedeSerEntregado(listaDeMensajeros.first(), unDestino)
    )
  }
  method pesoDelUltimoMensajero(){
    return(
      listaDeMensajeros.last().peso()
    )
  }
  method puedeAlgunoEntregarElPaquete(unDestino, unPaquete){
    return(
      listaDeMensajeros.any{listaDeMensajeros => unPaquete.puedeSerEntregado(listaDeMensajeros, unDestino)}
    )
  }
  method mensajerosQuePuedanLLevarElPaquete(unDestino, unPaquete){
    return(
      listaDeMensajeros.filter{listaDeMensajeros => unPaquete.puedeSerEntregado(listaDeMensajeros, unDestino)}
    )
  }
  method peso() {
    var totalPeso = 0
    listaDeMensajeros.forEach {mensajero => totalPeso = totalPeso + mensajero.peso()}
    return(
      totalPeso/listaDeMensajeros.size()
    )
  }
  method haySobrepeso(){
    return(
      self.peso() >= 500
    )
  }
  method enviarPaquete(unDestino, unPaquete){
    if(self.puedeAlgunoEntregarElPaquete(unDestino, unPaquete)){
      facturacion = facturacion + unPaquete.precio()
    }
    else{
      paquetesPendientes.add(unPaquete)
    }
  }
  method enviarPaquetes(paquetes, unDestino){
    paquetes.forEach{paquete => self.enviarPaquete(unDestino, paquete)}
  }
  method paquetePendienteMasCaro(){
    var masCaro = paquetesPendientes.first()
    paquetesPendientes.forEach{paquete => 
      if (paquete.precio() > masCaro.precio()){
        masCaro = paquete
      }
    }
    return (masCaro)
  }
  method enviarPaqueteMasCaro(){
    facturacion = facturacion + self.paquetePendienteMasCaro().precio() 
    paquetesPendientes.remove(self.paquetePendienteMasCaro())
  }
}
