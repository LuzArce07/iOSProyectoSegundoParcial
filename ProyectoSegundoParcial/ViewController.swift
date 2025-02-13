//
//  ViewController.swift
//  ProyectoSegundoParcial
//
//  Created by Alumno on 10/7/19.
//  Copyright © 2019 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var carros : [Carro] = []
    
    @IBOutlet weak var tvCarros: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.title = "Automoviles"
        
        carros.append(Carro(placa: "QWE0934", modelo: "Tsuru", marca: "Nissan", año: 2003, nombreConductor: "Gabriel Arce", fotografia: "Tsuru"))
        carros.append(Carro(placa: "PJF6982", modelo: "Mustang", marca: "Hyunda", año: 2019, nombreConductor: "Paco Cota", fotografia: "Mustang"))
        carros.append(Carro(placa: "OPJ0983", modelo: "Jeep", marca: "Ford", año: 2020, nombreConductor: "Luisa Medina", fotografia: "Jeep"))
        carros.append(Carro(placa: "OPJ0983", modelo: "Focus", marca: "Nissan", año: 2020, nombreConductor: "Cesar Lopez", fotografia: "Focus"))
        carros.append(Carro(placa: "OPJ0983", modelo: "Senda", marca: "Kia", año: 2020, nombreConductor: "Pancha Cota", fotografia: "Senda"))
        carros.append(Carro(placa: "OPJ0983", modelo: "Minicopper", marca: "Kia", año: 2020, nombreConductor: "Fer Nicolasa", fotografia: "Minicopper"))
        
        
        
        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return carros.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCarro") as? CeldaCarroController
        
        celda?.imgCarro.image = UIImage(named: carros[indexPath.row].fotografia!)
        celda?.lblPlacas.text = carros[indexPath.row].placa!
        celda?.lblModelo.text = carros[indexPath.row].modelo!
        celda?.lblMarca.text = carros[indexPath.row].marca!
        celda?.lblAño.text = "\(carros[indexPath.row].año!)"
        celda?.lblConductor.text = carros[indexPath.row].nombreConductor!
        
        return celda!
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 181
        
    }
    
    /*
     func agregar(contacto: Contacto) {
     contactos.append(contacto)
     tvContactos.reloadData()
     }
     */
    
    func agregarCarro(carro: Carro){
        
        carros.append(carro)
        tvCarros.reloadData()
        
    }
    
    func recargarTabla() {
        tvCarros.reloadData()
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
        
        if segue.identifier == "goToAgregarCarro"{
        
            let destino = segue.destination as? AgregarCarroController
            destino?.callbackAgregarCarro = agregarCarro
            
        }
        if segue.identifier == "goToDetallesCarro"{
            
            /*
             if segue.identifier == "goToEditar" {
             let destino = segue.destination as? EditarContactoController
             destino?.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
             destino?.callbackActualizarTabla = recargarTabla
             */
            
            let destino = segue.destination as? DetalleCarroController
            destino?.carro = carros[tvCarros.indexPathForSelectedRow!.row]
            destino?.callbackActualizarTabla = recargarTabla
            
            /*
            let indexPath = tvCarros.indexPath(for: (sender as? UITableViewCell)!)
            let listDestination = carros[indexPath!.row]
            */
        }
        
    }
    
 
}

