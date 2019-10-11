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
        
       
        
        let v_precio = txtPrecio.text!
        let cargaGasolina = CargaGasolina(carga: txtCarga.text!, precio: Int(v_precio)!)
        
        callbackAgregarCarga!(cargaGasolina)
        
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
