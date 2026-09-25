
class ChevroletCorsa {
    var color
    var position
    var posicionesRecorridas = []

    method capacidad() = 4

    method velocidadMaxima() = 150

    method peso() = 1300

    method color() = color

    method position() = position

    method cambiarColor(nuevoColor) {
        color = nuevoColor
    }

    method cambiarPosicion(nuevaPosicion) {
        position = nuevaPosicion
        posicionesRecorridas.add(nuevaPosicion)
    }

    method pasoPor(posicionBuscada) {
        return posicionesRecorridas.contains(posicionBuscada)
    }

    method pasoPorFila(numero) {
        return posicionesRecorridas.any({ posicion => posicion.x() == numero })
    }

    method recorrioFilas(listaDeNumeros) {
        return listaDeNumeros.all({ numero => self.pasoPorFila(numero) })
    }

    method image() {
        return color.image()
    }
}

class RenaultKwid {
    var tieneTanqueAdicional

    method capacidad() {
        if (tieneTanqueAdicional) {
            return 3
        } else {
            return 4
        }
    }

    method velocidadMaxima() {
        if (tieneTanqueAdicional) {
            return 120
        } else {
            return 110
        }
    }

    method peso() {
        if (tieneTanqueAdicional) {
            return 1350
        } else {
            return 1200
        }
    }

    method color() = azul //falta definir el objeto azul

    method ponerTanque() {
        tieneTanqueAdicional = true
    }

    method sacarTanque() {
        tieneTanqueAdicional = false
    }
}

object interiorComodo {
    method capacidad() = 5
    method peso() = 700
}

object interiorPopular {
    method capacidad() = 12
    method peso() = 1000
}

object motorPulenta {
    method velocidadMaxima() = 130
    method peso() = 800
}

object motorBataton {
    method velocidadMaxima() = 80
    method peso() = 500
}

object trafic {
    var interior = interiorComodo
    var motor = motorPulenta

    method capacidad() = interior.capacidad()

    method velocidadMaxima() = motor.velocidadMaxima()

    method peso() {
        return 4000 + interior.peso() + motor.peso()
    }

    method color() = blanco //falta definir el objeto blanco

    method cambiarInterior(nuevoInterior) {
        interior = nuevoInterior
    }

    method cambiarMotor(nuevoMotor) {
        motor = nuevoMotor
    }
}

class AutoEspecial {
    var capacidad
    var velocidadMaxima
    var peso
    var color

    method capacidad() = capacidad

    method velocidadMaxima() = velocidadMaxima

    method peso() = peso

    method color() = color
}

class Dependencia {
    var empleados
    var rodados = []
    var pedidos = []

    method agregarAFlota(rodado) {
        rodados.add(rodado)
    }

    method quitarDeFlota(rodado) {
        rodados.remove(rodado)
    }

    method pesoTotalFlota() {
        return rodados.sum({ rodado => rodado.peso() })
    }

    method estaBienEquipada() {
        return
            rodados.size() >= 3 &&
            rodados.all({ rodado => rodado.velocidadMaxima() >= 100 })
    }

    method capacidadTotalEnColor(colorBuscado) {
        return rodados
            .filter({ rodado => rodado.color() == colorBuscado })
            .sum({ rodado => rodado.capacidad() })
    }

    method rodadoMasRapido() {
        return rodados.max({ rodado => rodado.velocidadMaxima() })
    }

    method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()

    method capacidadFaltante() {
        return empleados - rodados.sum({ rodado => rodado.capacidad() })
    }

    method esGrande() = empleados >= 40 && rodados.size() >= 5

    

    method agregarPedido(pedido) {
        pedidos.add(pedido)
    }

    method quitarPedido(pedido) {
        pedidos.remove(pedido)
    }

    method totalPasajerosPedidos() {
        return pedidos.sum({ pedido => pedido.cantidadPasajeros() })
    }

    method pedidosNoSatisfechos() {
        return pedidos.filter({ pedido => not rodados.any({ rodado => pedido.puedeSerSatisfechoPor(rodado) }) })
    }

    method todosLosPedidosIncompatiblesCon(color) {
        return pedidos.all({ pedido => pedido.esIncompatible(color) })
    }

    method relajarTodosLosPedidos() {
        pedidos.forEach({ pedido => pedido.relajar() })
    }
}

class Pedido {
    var distancia
    var tiempoMaximo
    var pasajeros
    var coloresIncompatibles

    method velocidadRequerida() = distancia / tiempoMaximo

    method cantidadPasajeros() = pasajeros

    method esIncompatible(color) = coloresIncompatibles.contains(color)

    method puedeSerSatisfechoPor(rodado) {
        return
            rodado.velocidadMaxima() >= self.velocidadRequerida() + 10 &&
            rodado.capacidad() >= pasajeros &&
            not self.esIncompatible(rodado.color())
    }

    method acelerar() { //recordar que esto es un metodo de indicacion ya que no devuelve(return) nada a la consola
        tiempoMaximo = tiempoMaximo - 1
    }

    method relajar() { //recordar que esto es un metodo de indicacion ya que no devuelve(return) nada a la consola
        tiempoMaximo = tiempoMaximo + 1
    }
}

object rojo {
    method nombre() = "rojo"
    method image() = "autoRojo.png"
}

object azul {
    method nombre() = "azul"
    method image() = "autoAzul.png"
}

object verde {
    method nombre() = "verde"
    method image() = "autoVerde.png"
}

object beige {
    method nombre() = "beige"
    method image() = "autoBeige.png"
}

object blanco {
    method nombre() = "blanco"
    method image() = "autoBlanco.png"
}

object negro {
    method nombre() = "negro"
    method image() = "autoNegro.png"
}

