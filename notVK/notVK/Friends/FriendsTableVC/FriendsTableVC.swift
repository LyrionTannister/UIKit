//
//  FriendsTableViewController.swift
//  notVK
//
//  Created by Roman on 31.03.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    var myFfriends = User.init(friends: ["Alexander Chernykh",
                                      "Evgeny Elchev",
                                      "Vladislav Likhachev"])
    override func viewDidLoad() {
        super.viewDidLoad()

    // MARK: - Table view properties

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFfriends.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell

        cell.myFriendLabel.text = myFfriends.friends[indexPath.row]

        cell.shadowLayer.image
            .image = UIImage(named: myFfriends.friends[indexPath.row])

        return cell
    }

    // MARK: - For Next ToDo
    
}
