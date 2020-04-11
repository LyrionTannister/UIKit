//
//  AllGroupsTableViewController.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var allGroups = Group.init(groups:
        ["iOS",
        "Swift",
        "GeekBrains",
        "Mail,ru",
        "Tool",
        "iPhone",
        "Podcasts",
        "TV Series",
        "Movies",
        "Radiohead"])

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsTableViewCell

        let group = allGroups.myGroups[indexPath.row]
        cell.allGroupsLabel.text = group
        return cell
    }

    // MARK: - Navigation
}
