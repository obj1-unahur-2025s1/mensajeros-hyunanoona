import paquetes.*
import mensajeros.*
import empresa.*

object brooklyn {
  method puedePasar(mensajero){
    return(
      mensajero.peso() <= 1000
    )
  }
}

object matrix {
 method puedePasar(mensajero) {
   return(
    mensajero.puedeLlamar()
   )
 } 
}