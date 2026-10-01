
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

    var capacidad = self.valorDeCapacidadSiHayTanque()

    method valorDeCapacidadSiHayTanque(){
        if(tieneTanqueAdicional){
            return 4
        } else {
            return 3
        }
    }

    method capacidad() = capacidad

    var velocidadMaxima = self.valorDeVelocidadMaximaSiHayTanque()

    method valorDeVelocidadMaximaSiHayTanque(){
        if(tieneTanqueAdicional){
            return 120
        } else {
            return 110
        }
    }

    method velocidadMaxima() = velocidadMaxima

    var peso = 1200

    method valorDePesoSiHayTanque(){
        if (tieneTanqueAdicional){
            return 150
        } else{
            return 0
        }
    }

    method peso() = peso + self.valorDePesoSiHayTanque()

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

    var capacidad

    method capacidad() = self.interior().capacidad()

    //La velocidad máxima es la que permite el motor
    //(significa la velocidad maxima del motor que tiene alojado).

    var velocidadMaxima

    method velocidadMaxima() = self.motor().velocidadMaxima()

    //El peso es 4000 kg más el peso del interior más el del motor.
    //(significa el peso del interior que tiene alojado mas 
    // el peso del motor que tiene alojado)

    var peso = 4000

    method peso() = peso + self.interior().peso() + self.motor().peso()
    
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
    new ChevroletCorsa(color ="violeta")
//        color = "azul",       //en el corsa es obligatorio asignarle un color
//        capacidad = 5,        //no es necesario asignar un dato por que ya tiene uno por defecto
//        velocidadMaxima = 200,//no es necesario asignar un dato por que ya tiene uno por defecto
//        peso = 2000           //no es necesario asignar un dato por que ya tiene uno por defecto
//    )

const autoEspecial_2 = new RenaultKwid()

const autoEspecial_3 =
    new Trafic(capacidad = 5,velocidadMaxima = 200)
        //color = "azul",       //no es necesario asignar un dato por que ya tiene uno por defecto
//        capacidad = 5,        //en la trafic es obligatorio asignarle una capacidad
//        velocidadMaxima = 200,//en la trafic es obligatorio asignarle una velocidad maxima 
        //peso = 2000           //no es necesario asignar un dato por que ya tiene uno por defecto
//    )

object dependencia {

    var almacen = []

    method almacen() = almacen

    method agregarAFlota(unRodado){
        almacen.add(unRodado)
    }

    method quitarDeFlota(unRodado){
        almacen.remove(unRodado)
    }

    method pesoTotalFlota(){
        return almacen.sum({unRodado => unRodado.peso()})
    }

    method estaBienEquipada() = self.almacen().size() >= 3

    method capacidadTotalEnColor(unColor) {
        return almacen.count({ unRodado => unRodado.capacidad() == unColor })
    }

    method colorDelRodadoMasRapido() {
        return almacen.max({ unRodado => unRodado.velocidadMaxima() }).color()
    }
}


