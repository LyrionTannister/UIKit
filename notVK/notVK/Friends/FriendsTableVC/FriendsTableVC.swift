//
//  FriendsTableViewController.swift
//  notVK
//
//  Created by Roman on 31.03.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {

    struct Section <T> {
        var title: String
        var items: [T]
    }

    var allMyFriends = FriendFactory.makeFriends()
    var friendsSection = [Section<User>]()


    @IBOutlet weak var searchMyFriend: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    // MARK: - Table view properties

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        let friendsDictionary = Dictionary.init(grouping: allMyFriends) {
            $0.firstName.prefix(1)
        }

        friendsSection = friendsDictionary.map {Section(title: String($0.key), items: $0.value)}

        friendsSection.sort {$0.title < $1.title}
        
        searchMyFriend.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSection.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsSection[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsTableViewCell

        let friends = friendsSection[indexPath.section].items[indexPath.row]

        cell.myFriendLabel.text = friends.firstName + " " + friends.lastName
        cell.shadowLayer.image.image = UIImage(named: friends.fotoPath)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSection[section].title
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSection.map {$0.title}
    }

}
