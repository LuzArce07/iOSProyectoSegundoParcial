//
//  DetalleCarroController.swift
//  ProyectoSegundoParcial
//
//  Created by Alumno on 10/9/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import Foundation
import UIKit

class DetalleCarroController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cargas : [CargaGasolina] = []
    
    @IBOutlet weak var tvCargas: UITableView!
    
    
    override func viewDidLoad() {
        
        cargas.append(CargaGasolina(carga: "8 Lts", precio: 500))
        cargas.append(CargaGasolina(carga: "10 Lts", precio: 100))
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cargas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda =  tableView.dequeueReusableCell(withIdentifier: "celdaCarga") as? CeldaCargaController
        
        celda?.lblCarga.text = cargas[indexPath.row].carga!
        celda?.lblPrecio.text = "\(cargas[indexPath.row].precio!)"
        
        
        return celda!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func agregarCarga(carga: CargaGasolina){
        
        cargas.append(carga)
        tvCargas.reloadData()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
            /*
             
             if segue.identifier == "goToEditar" {
             let destino = segue.destination as? EditarContactoController
             destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
             destino?.callbackActualizarTabla = recargarTabla
             
             }
             if segue.identifier == "goToNuevo" {
             let destino = segue.destination as? NuevoContactoController
             destino?.callbackAgregar = agregar
             
             }
             
             */
            
            if segue.identifier == "goToAgregarCarga"{
                
                let destino = segue.destination as? AgregarCargaController
                destino?.callbackAgregarCarga = agregarCarga
            
    
        }
        
    }
    
}
