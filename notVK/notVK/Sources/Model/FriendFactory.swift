//
//  friendFactory.swift
//  notVK
//
//  Created by Roman on 13.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class  Friend  {
    struct FriendResponse: Decodable {
        var response: FriendList
    }

    struct FriendList: Decodable {
        var count: Int
        var items: [FriendItem]
    }

    struct FriendItem: Decodable {
        var first_name: String
        var last_name: String
        var online: Int
        var photo_100: String?
        var id: Int
    }
}
