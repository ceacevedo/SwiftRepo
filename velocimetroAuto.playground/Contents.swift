//: Playground - noun: a place where people can play

import UIKit

enum Velocidades: Int{
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init( velocidadInicial : Velocidades ){
        self = velocidadInicial
    }
    
    func getLeyendaVelocidadActual () -> String{
        var leyenda = ""
        switch self {
        case .Apagado:
            leyenda = "Apagado"
        case .VelocidadBaja:
            leyenda = "Velocidad baja"
        case .VelocidadMedia:
            leyenda = "Velocidad media"
        case .VelocidadAlta:
            leyenda = "Velocidad alta"
        }
        return leyenda
    }
    
    mutating func siguienteVelocidad () {
  
        switch self {
        case .Apagado:
            self = .VelocidadBaja
        case .VelocidadBaja:
            self = .VelocidadMedia
        case .VelocidadMedia:
            self = .VelocidadAlta
        case .VelocidadAlta:
            self = .VelocidadMedia
        }
    }
}

class Auto {
    var velocidad: Velocidades
    
    init(){
        self.velocidad = Velocidades(velocidadInicial: Velocidades.Apagado)
    }
    
    func cambioDeVelocidad( ) -> ( actual : Int, velocidadEnCadena: String){
        let impresion: (Int, String) = (velocidad.rawValue, velocidad.getLeyendaVelocidadActual())
        velocidad.siguienteVelocidad()
        return impresion
        
    }
    
    func printVelocimetro(){
        let impresion = cambioDeVelocidad()
        print("\(impresion.actual), \(impresion.velocidadEnCadena)")
    }
    
}

// Prueba del metodo
var auto = Auto()

for i in 0...20 {
    auto.printVelocimetro()
}
