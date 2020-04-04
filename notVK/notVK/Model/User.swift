//
//  User.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import Foundation

struct User {
    lazy var friends = [String]()
    var name: String = ""
    init(friends: [String]) {
        self.friends = friends
    }
}
