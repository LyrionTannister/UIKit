//
//  FriendsTableViewCell.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendView: DropShadow! {
        didSet {
            friendView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var friendPic: UIImageView! {
        didSet {
            friendPic.layer.cornerRadius = 25
            friendPic.layer.masksToBounds = true
            
            friendPic.layer.shouldRasterize = true
        }
    }
    @IBOutlet weak var myFriendLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
