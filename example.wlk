object chasquicoop {
  var sucursales = #{}
  var flotaDeVehiculos = []

  method sucursales(){
    return sucursales
  }
  method flotaDeVehiculos(){
    return flotaDeVehiculos
  }
  method addVehiculo(vehiculo) {
    flotaDeVehiculos = flotaDeVehiculos + [vehiculo]
  }
  method addSucursal(sucursal) {
    sucursales = sucursales + [sucursal]
  }
}
object sucursal{
    var flotaDeVehiculos = []
    method flotaDeVehiculos(){
      return flotaDeVehiculos
    }
    method addVehiculo(vehiculo) {
    flotaDeVehiculos = flotaDeVehiculos + [vehiculo]
    }
}
class economico {
  var property capacidad = 5
  var property velocidadMaxima = 120
  var property autonomia = 200
  var property color = "beige"
  var adaptaciones = []
  var llevaSillaDeRuedas = false
  var esSilencioso = false
  
  method adaptaciones() {
    return adaptaciones
  }
  method llevaSillaDeRuedas() {
    return llevaSillaDeRuedas
  }
  method esSilencioso() {
    return esSilencioso
  }
  method addAdaptacion(adaptacion) {
    self.validarSillaDeRuedas(adaptacion)
    self.validarRuido(adaptacion)
    adaptacion.espacioRequerido(self)
    adaptacion.modificarAutonomia(self)
    adaptaciones = adaptaciones + [adaptacion]
    velocidadMaxima = adaptaciones.map({adaptacion => adaptacion.requerimiento()}).min()
  }
  method validarSillaDeRuedas(adaptacion) {
    if (adaptacion == transportadorSillaDeRuedas) {
      llevaSillaDeRuedas = adaptacion.requiereSillaDeRuedas()
    }
  }
  method validarRuido(adaptacion){
    if (not (adaptacion == transportadorSillaDeRuedas)) {
      esSilencioso = adaptacion.reduceRuido()
    }
  }
  method modificarAutonomia(cantidad) {
    autonomia = autonomia + cantidad
  }
  method espacioRequerido(cantidad) {
    capacidad = capacidad + cantidad
  }
  
}
object transportadorSillaDeRuedas{
  method requiereSillaDeRuedas() {
    return true
  }
  method reduceRuido() {
    return false
  }
  method requerimiento(){
      return 90
  }
  method modificarAutonomia(vehiculo) {
    vehiculo.modificarAutonomia(-20)
  }
  method espacioRequerido(vehiculo) {
    vehiculo.capacidad(vehiculo.capacidad() - 1)
  }
}
object cañoDeEscapeSilencioso{
  method requiereSillaDeRuedas() {
    return false
  }
  method reduceRuido() {
    return true
  }
  method requerimiento(){
   return 115
  }
  method modificarAutonomia(vehiculo) {
    vehiculo.modificarAutonomia(-10)
  }
  method espacioRequerido(vehiculo) {
    // No reduce la capacidad del vehículo
  }
}
object tanqueExtra{
  method requiereSillaDeRuedas() {
    return false
  }
  method requerimiento(){
    return 80
  }
  method reduceRuido() {
    return true
  }
  method modificarAutonomia(vehiculo) {
    vehiculo.modificarAutonomia(200)
  }
  method espacioRequerido(vehiculo) {
    vehiculo.capacidad(vehiculo.capacidad() - 1)
  }
}

class torino{
    const capacidad = 4
    const esSilencioso = false
    var property color = "bordo"
    var property autonomia = 0
    var property velocidadMaxima = 0
    var llevaSillaDeRuedas = false
    
      method capacidad(){
        return capacidad
      }
      method esSilencioso() {
        return esSilencioso
      }
      method llevaSillaDeRuedas() {
        return llevaSillaDeRuedas
      }
}

object combiAdaptable{
  const capacidad = interior.capacidad()
  var property velocidadMaxima = motor.velocidadMaxima()
  var property interior = interiorEspacioso
  var property autonomia = motor.autonomia()
  var property motor = motorDeportivo
  var property llevaSillaDeRuedas = interior.requiereSillaDeRuedas()
  var property esSilencioso = motor.reduceRuido()
  const  color = "celeste"
    method color() {
      return color
    }
}
object interiorEspacioso{
  method requiereSillaDeRuedas() {
    return false
  }
  method capacidad(){
    return 7
  }
}
object interiorAccesible{
  method requiereSillaDeRuedas() {
    return true
  }
  method capacidad(){
    return 5
  }
}
object motorDeportivo{
  method reduceRuido() {
    return false
  }
  method autonomia(){
    return 400
  }
  method velocidadMaxima(){
    return 230
  }
}
object motorUrbano{
  method reduceRuido() {
    return true
  }
  method autonomia(){
    return 1000
  }
  method velocidadMaxima(){
    return 130
  }
}