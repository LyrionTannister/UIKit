//
//  GroupsViewCell.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class GroupsViewCell: UITableViewCell {

    @IBOutlet weak var myGroupLabel: UILabel!
    @IBOutlet weak var myGroupPic: UIImageView!{
        didSet {
            myGroupPic.layer.cornerRadius = 25
            myGroupPic.layer.masksToBounds = true
            
            myGroupPic.layer.shouldRasterize = true
        }
    }
    @IBOutlet weak var roundedView: UIView! {
        didSet {
// MARK: - Можно ли вынести это своство в класс DropShadow? У меня не получилось.
            roundedView.layer.cornerRadius = 25
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
