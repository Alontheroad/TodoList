//
//  ToDoListViewController.swift
//  TodoList
//
//  Created by Aloys Ratinet on 18-09-12.
//  Copyright © 2018 Aloys Ratinet. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    // Pour sauvegarder nos données même si on éteint l'application
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Finir demande de visa"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Appeler Jason ce soir"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Progresser sur Swift"
        itemArray.append(newItem3)
        

        
        // Pour Afficher les données sauvegardées
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        // Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        // cell.accessoryType = item.done (== true) ? .checkmark : .none
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        //Supprimer l'effet checkmark redondant du fait du reusable
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        
        //Ajouter un accessory : "checkmark"
        //Supprimer le checkmark s'il existe avec un "none"
//        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
     // supprime l'effet de couleur (gris) sur la ligne sélectionnée après sélection.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Ajouter une nouvelle tâche", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ajouter une tâche", style: .default) { (action) in
            // what will happen once the user clicks the Add item button on our UIAlert
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
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

