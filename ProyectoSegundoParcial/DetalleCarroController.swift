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
    
    var accionBoton : Bool?
    
    var carro : Carro?
    var callbackActualizarTabla : (() -> Void)?
    
    //var editarAuto = ((Carro) -> Void)?
    
    @IBOutlet weak var tvCargas: UITableView!
    
    
    @IBOutlet weak var txtPlacas: UITextField!
    @IBOutlet weak var txtMarca: UITextField!
    @IBOutlet weak var txtModelo: UITextField!
    @IBOutlet weak var txtAño: UITextField!
    @IBOutlet weak var txtConductor: UITextField!
    
    @IBOutlet weak var btnAccion: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        accionBoton = false
        
        cargas.append(CargaGasolina(carga: "8", precio: 500))
        cargas.append(CargaGasolina(carga: "10", precio: 100))
        cargas.append(CargaGasolina(carga: "30", precio: 900))
        
        txtPlacas.text = carro!.placa
        txtMarca.text = carro!.marca
        txtModelo.text = carro!.modelo
        txtAño.text = "\(carro!.año ?? 0)"
        txtConductor.text = carro!.nombreConductor
        
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            self.cargas.remove(at: indexPath.row)
            self.tvCargas.reloadData()
            
        }
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
    
    
    @IBAction func doTapEditar(_ sender: Any) {
        
        if accionBoton == false {
            
            btnAccion.title = "Guardar"
            
            txtPlacas.isEnabled = true
            txtMarca.isEnabled = true
            txtModelo.isEnabled = true
            txtAño.isEnabled = true
            txtConductor.isEnabled = true
            accionBoton = true
            
            
            /* 
            self.navigationItem.leftBarButtonItem?.title = "Guardar"
            _ = navigationController?.view.snapshotView(afterScreenUpdates: true)
            */
           
            
        } else {
            
            carro?.placa = txtPlacas.text
            carro?.marca = txtMarca.text
            carro?.modelo = txtModelo.text
            carro?.año = Int(txtAño.text ?? "0")
            carro?.nombreConductor = txtConductor.text
            
            callbackActualizarTabla!()
             self.navigationController?.popViewController(animated: true)
            
        }
        
        
    }
    
    
}
