//
//  AllGroupsTableViewController.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    let allGroups: [Group] = [
        Group(name: "iOS", count: 1024,
              groupType: Group.GroupType.openGroup, fotoPath: "iconGroupVK"),
        Group(name: "GeekBrains", count: 543, groupType: Group.GroupType.openGroup, fotoPath: "iconGroupVK"),
        Group(name: "Apple", count: 335654, groupType: Group.GroupType.openGroup, fotoPath: "iconGroupVK"),
        Group(name: "Сплат", count: 1234, groupType: Group.GroupType.openGroup, fotoPath: "iconGroupVK")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsTableViewCell

        let group = allGroups[indexPath.row]
        cell.allGroupsLabel.text = group.name
        return cell
    }

    // MARK: - Navigation
}
