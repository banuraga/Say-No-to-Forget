//
//  ViewController.swift
//  Say No to Forget
//
//  Created by Andika Banuraga on 22/03/20.
//  Copyright © 2020 Andika Banuraga. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
//    var itemArray = ["Design Cloud Project", "Fix Autify testing", "Interview Global Candidates","b","lala", "susu", "kakak", "Hahahihi", "Runescape", "Wayolo", "Study UX design", "Prepare for 1 on 1", "What happen to you", "I don't know", "b","lala", "susu", "kakak", "Hahahihi", "Runescape", "Wayolo", "Study UX design", "Prepare for 1 on 1", "What happen to you", "I don't know"]
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Finish the design"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Ask Miyake-san about paid leave"
        itemArray.append(newItem3)
        
        
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]{
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
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if itemArray[indexPath.row].done == true{
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        //replacing the if else statement that is not elegant. Just make it reverse
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else{
//            itemArray[indexPath.row].done = false
//        }
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Let's add something!", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            //self.itemArray.append(textfield.text!)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            //reload new data
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    

}

