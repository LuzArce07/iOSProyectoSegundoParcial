//
//  AgregarCarroController.swift
//  ProyectoSegundoParcial
//
//  Created by Alumno on 10/8/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class AgregarCarroController: UIViewController {
    
    //var callbackActualizarTablaCarro : (() -> Void)?
    
    var callbackAgregarCarro : ((Carro) -> Void)?
    
    @IBOutlet weak var txtPlacas: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtAño: UITextField!
    @IBOutlet weak var txtConductor: UITextField!
    
    
    @IBAction func doTapGuardar(_ sender: Any) {
        
        /*
         let contacto = Contacto(nombre: txtNombre.text!, telefono: txtTelefono.text!, direccion: "", correo: "", foto: "foto2")
         callbackAgregar!(contacto)
 */
        let v_año = txtAño.text!
        let carro = Carro(placa: txtPlacas.text!, modelo: txtModelo.text!, marca: txtMarca.text!, año: Int(v_año)!, nombreConductor: txtConductor.text!, fotografia: "foto1.jpeg")
        
        callbackAgregarCarro!(carro)
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
}
