//
//  Carro.swift
//  ProyectoSegundoParcial
//
//  Created by Alumno on 10/7/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation

class Carro {
    
    var placa : String
    var modelo : String
    var marca : String
    var año : Int
    var nombreConductor : String
    var fotografia : String
    
    init(placa : String, modelo : String, marca : String, año : Int, nombreConductor : String, fotografia : String) {
        
        self.placa = placa
        self.modelo = modelo
        self.marca = marca
        self.año = año
        self.nombreConductor = nombreConductor
        self.fotografia = fotografia
        
    }
    
}
