
class ChevroletCorsa {

    var color

    method color() = color

    var capacidad = 4

    method capacidad() = capacidad

    var velocidadMaxima = 150

    method velocidadMaxima() = velocidadMaxima

    var peso = 1300

    method peso() = peso

}

class RenaultKwid {

    var color = "azul"

    method color() = color

    var tieneTanqueAdicional = false

    method capacidad() {

        if(tieneTanqueAdicional){
            return 4
        } else {
            return 3
        }

    }

    method velocidadMaxima() {
        if(tieneTanqueAdicional){
            return 120
        } else {
            return 110
        }
    }

    method peso() = 1200 + if (tieneTanqueAdicional) 150 else 0

}

class Trafic {

    var color = "blanco"

    method color() = color

    var interior = interiorComodo

    method interior() = interior

    method cambiarInterior(nuevoInterior){
        interior = nuevoInterior
    }

    var motor = motorPulenta

    method motor() = motor

    method cambiarMotor(nuevoMotor){
        motor = nuevoMotor
    }

    //La capacidad de la Trafic es la del interior
    //(significa la capacidad del interior que tiene alojado).

    method capacidad() = self.interior().capacidad()

    //La velocidad máxima es la que permite el motor
    //(significa la velocidad maxima del motor que tiene alojado).

    method velocidadMaxima() = self.motor().velocidadMaxima()

    //El peso es 4000 kg más el peso del interior más el del motor.
    //(significa el peso del interior que tiene alojado mas 
    // el peso del motor que tiene alojado)

    method peso() = 4000 + self.interior().peso() + self.motor().peso()
    
}

object fabrica {
    var almacen = []

    method almacen() = almacen

    method agregarAuto(unAuto){
        almacen.add(unAuto)
    }
}

// interiores

object interiorComodo {

    method capacidad() = 5

    method peso() = 700

}

object interiorPopular {

    method capacidad() = 12

    method peso() = 1000

}

// motores

object motorPulenta {

    method velocidadMaxima() = 130

    method peso() = 800
  
}

object motorBataton{

    method velocidadMaxima() = 500

    method peso() = 80
  
}

const autoEspecial_1 =
    new ChevroletCorsa(
        color = "azul",
        capacidad = 5,
        velocidadMaxima = 200,
        peso = 2000
    )

const autoEspecial_2 =
    new Trafic(
        //color = "azul",
        capacidad = 5,
        velocidadMaxima = 200,
        peso = 2000
    )
