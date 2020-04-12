//
//  GroupsTableViewController.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var myGroups = Group.init(groups: [])

    override func viewDidLoad() {
        super.viewDidLoad()
    // MARK: - Table view properties
        self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsViewCell
        let group = myGroups.myGroups[indexPath.row]
        cell.myGroupLabel.text = group
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let alert = UIAlertController(
            title: "Группа",
            message: "Ты выбрал строку \(indexPath.row)",
            preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
    
        alert.addAction(action)
        present(alert, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation
    @IBAction func addGroupUnwindAction(unwindSegue: UIStoryboardSegue){
        if unwindSegue.identifier == "addGroup" {
            guard let allGroupsController = unwindSegue.source as? AllGroupsTableViewController else {
                return
            }
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                let group = allGroupsController.allGroups.myGroups[indexPath.row]
                if !myGroups.myGroups.contains(group){
                    myGroups.myGroups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
}