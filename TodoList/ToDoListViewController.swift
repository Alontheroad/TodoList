//
//  ToDoListViewController.swift
//  TodoList
//
//  Created by Aloys Ratinet on 18-09-12.
//  Copyright © 2018 Aloys Ratinet. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemArray = ["Finir demande de Visa", "Envoyer email à Pascal", "Faire du sport aujourd'hui"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //Ajouter un accessory : "checkmark"
        //Supprimer le checkmark s'il existe avec un "none"
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
      
//        itemArray[indexPath.row]
        
        
        
     // supprime l'effet de couleur (gris) sur la ligne sélectionnée après sélection.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


    
    
    
}

