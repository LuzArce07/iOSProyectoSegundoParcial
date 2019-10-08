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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Automoviles"
        /*
        carros = [
        let l1 = Carro(placa: "WWQ098", modelo: "Tsuru", marca: "Nissan", año: 2010, nombreConductor: "Pablo Urias", fotografia: "foto1.jpeg"),
        let l2 = Carro(placa: "WWQ098", modelo: "Tsuru", marca: "Nissan", año: 2010, nombreConductor: "Pablo Urias", fotografia: "foto1.jpeg"),
        let l3 = Carro(placa: "WWQ098", modelo: "Tsuru", marca: "Nissan", año: 2010, nombreConductor: "Pablo Urias", fotografia: "foto1.jpeg")
        ]
        */
        
        carros.append(Carro(placa: "1", modelo: "1", marca: "2", año: 23, nombreConductor: "g", fotografia: "foto1.jpeg"))
        
        
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

    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 181
    }
    */
 
}

