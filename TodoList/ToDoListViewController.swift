//
//  ToDoListViewController.swift
//  TodoList
//
//  Created by Aloys Ratinet on 18-09-12.
//  Copyright © 2018 Aloys Ratinet. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["Finir demande de Visa", "Envoyer email à Pascal", "Faire du sport aujourd'hui"]
    
    // Pour sauvegarder nos données même si on éteint l'application
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pour Afficher les données sauvegardées
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
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
        
     // supprime l'effet de couleur (gris) sur la ligne sélectionnée après sélection.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Ajouter une nouvelle tâche", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ajouter une tâche", style: .default) { (action) in
            // what will happen once the user clicks the Add item button on our UIAlert
            self.itemArray.append(textField.text!)
            
            // Accès à nos données si l'iphone est éteint
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            // met à jour la tableView pour afficher notre nouvel item
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Créer une nouvelle tâche"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}

