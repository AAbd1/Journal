//
//  EntryTableViewController.swift
//  Journal
//
//  Created by Abdi on 8/22/18.
//  Copyright © 2018 Abdi. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.entries = EntryController.shared.loadToPersistence()
//        EntryController.shared.loadToPersistence()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        let entries = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entries.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        cell.detailTextLabel?.text = dateFormatter.string(for: entries.timestamp)
       // cell.detailTextLabel?.text = ("\(entries.timestamp)")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.delete(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            
            let destinationVC = segue.destination as? DetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let entry = EntryController.shared.entries[indexPath.row]
            destinationVC?.entries = entry
        }
        
    }
    
    
}
