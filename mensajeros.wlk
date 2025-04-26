import paquetes.*
import destinos.*
import empresa.*

object roberto {
  var vehiculo = null
  method peso(){
    return(
      90 + vehiculo.peso()
    )
  }
  method vehiculo(unVehiculo) {
    vehiculo = unVehiculo
  }
  method puedeLlamar() {
    return(
      false
    )
  }
}

object chuckNorris {
  method peso(){
    return(
      80
    )
  }
  method puedeLlamar(){
    return(
      true
    )
  }
}

object neo {
  var cantidadDeCreditos = false
  method peso() {
    return(
      0
    )
  }
  method siTieneCredito(){
    cantidadDeCreditos = true
  }
  method puedeLlamar(){
    return(
      cantidadDeCreditos
    )
  }
}

object bicicleta {
  method peso(){
    return(
      5
    )
  }
}

object camion {
  var peso = 0 
  method peso(){
    return(
      peso
    )
  }
  method acoplarAlCamion(unaCantidad){
    peso = peso + 500*unaCantidad
  }
}
