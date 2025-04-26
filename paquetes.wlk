import destinos.*
import mensajeros.*
import empresa.*

object paquete {
  var paqueteEstaPago = false
  method precio(){
    return(
      50
    )
  }
  method estaPago(){
    return(
      paqueteEstaPago
    )
  }
  method pagarPaquete(){
    paqueteEstaPago = true
  }
  method puedeSerEntregado(unMensajero, unDestino) {
    return(
      unDestino.puedePasar(unMensajero) && self.estaPago()
    )
  }
}

object paquetito{
  method precio(){
    return(
      0
    )
  }
  method puedeSerEntregado(unMensajero, unDestino){
    return(true)
  }
}

object paquetonViajero {
  const destinosQueSeEstanPagando = []
  var plataPagadaDelDestino = 0
  var plataPagada = 0
  const destinosPagados = []
  method precio(){
    return(
      plataPagada
    )
  }
  method estaPago(unDestino){
    return(
      destinosPagados.contains(unDestino)
    )
  }
  method pagarPaqueton(unNumero, unDestino){
    if(not(destinosQueSeEstanPagando.contains(unDestino))){
      destinosQueSeEstanPagando.add(unDestino)
    }
    if(not(self.estaPago(unDestino))  && destinosQueSeEstanPagando.contains(unDestino) && plataPagadaDelDestino < 100){
      plataPagadaDelDestino = plataPagadaDelDestino + unNumero
    }
    if(destinosQueSeEstanPagando.contains(unDestino) && plataPagadaDelDestino == 100){
      plataPagadaDelDestino = 0
      plataPagada = plataPagada + 100
      destinosQueSeEstanPagando.remove(unDestino)
      destinosPagados.add(unDestino)
    }
  }
  method puedeSerEntregado(unMensajero, unDestino){
    return(
      unDestino.puedePasar(unMensajero) && self.estaPago(unDestino)
    )
  }
  method destinosPasados(){
    return(
      destinosPagados
    )
  }
}

