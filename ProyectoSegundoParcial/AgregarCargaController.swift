//
//  AgregarCargaController.swift
//  ProyectoSegundoParcial
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class AgregarCargaController : UIViewController {
    
    //var callbackActualizarTablaCarga : (() -> Void)?
    
    var callbackAgregarCarga : ((CargaGasolina) -> Void)?
    
    @IBOutlet weak var txtCarga: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    
    
    @IBAction func doTapTerminado(_ sender: Any) {
        
        /*
         let contacto = Contacto(nombre: txtNombre.text!, telefono: txtTelefono.text!, direccion: "", correo: "", foto: "foto2")
         callbackAgregar!(contacto)
 
        let v_año = txtAño.text!
        let carro = Carro(placa: txtPlacas.text!, modelo: txtModelo.text!, marca: txtMarca.text!, año: Int(v_año)!, nombreConductor: txtConductor.text!, fotografia: "foto1.jpeg")
        
        callbackAgregarCarro!(carro)
        
        self.navigationController?.popViewController(animated: true)*/
        
        let v_precio = txtPrecio.text!
        let cargaGasolina = CargaGasolina(carga: txtCarga.text!, precio: Int(v_precio)!)
        
        callbackAgregarCarga!(cargaGasolina)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
