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
    
    var friendsDictionary = [Character:[User]]()
    var firstLetters: [Character] {
        get {
            friendsDictionary.keys.sorted()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        friendsDictionary = self.getSortedUsers(searchText: nil)
        
    // MARK: - Table view properties

        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = self.editButtonItem

        let friendsFinder = Dictionary.init(grouping: allMyFriends) {
            $0.lastName.prefix(1)
        }

        friendsSection = friendsFinder.map {Section(title: String($0.key), items: $0.value)}

        friendsSection.sort {$0.title < $1.title}
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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewForHeaderInSection = CustomSectionDesign()
        viewForHeaderInSection.label.text = String(firstLetters[section].uppercased())
        return viewForHeaderInSection
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSection.map {$0.title}
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSection[section].title
    }

    func getSortedUsers(searchText: String?) -> [Character:[User]]{
        var tempUsers: [User]
        if let text = searchText?.lowercased(), searchText != "" {
            tempUsers = allMyFriends.filter{ $0.lastName.lowercased().contains(text)}
        } else {
            tempUsers = allMyFriends
        }
        let sortedUsers = Dictionary.init(grouping: tempUsers) { $0.lastName.lowercased().first! }
            .mapValues{ $0.sorted{ $0.lastName.lowercased() < $1.lastName.lowercased() } }
        return sortedUsers
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clickToDetail" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let imagesVC = segue.destination as! FriendsCollectionViewController
                imagesVC.friendsPhotos = friendsSection[indexPath.section].items[indexPath.row].photos
            }
        }
    }
}
