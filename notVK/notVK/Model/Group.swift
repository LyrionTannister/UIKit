//
//  Group.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import Foundation
// Friend factory
class Group: Comparable {

    enum GroupType: CustomStringConvertible {

        case openGroup
        case onlyForRegistered
        case privateGroup

        var description: String {
            switch self {
            case .openGroup:
                return "Открытое сообщество"
            case .onlyForRegistered:
                return "Только для зарегистрированных"
            case .privateGroup:
                return "Частное сообщество"
            }
        }
    }

    let name: String
    var count: Int
    let groupType: GroupType
    var fotoPath: String

    init(name: String, count: Int, groupType: GroupType, fotoPath: String) {
        self.name = name
        self.count = count
        self.groupType = groupType
        self.fotoPath = fotoPath
    }

    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }

    static func < (lhs: Group, rhs: Group) -> Bool {
        return lhs.name < rhs.name
    }

    static func > (lhs: Group, rhs: Group) -> Bool {
        return lhs.name > rhs.name
    }
}
