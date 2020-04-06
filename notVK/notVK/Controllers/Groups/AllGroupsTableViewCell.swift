//
//  AllGroupsTableViewCell.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var allGroupsLabel: UILabel!
    @IBOutlet weak var allGroupsPic: UIImageView!{
        didSet {
            allGroupsPic.layer.cornerRadius = 25
            allGroupsPic.layer.masksToBounds = true
            
            allGroupsPic.layer.shouldRasterize = true
        }
    }
    @IBOutlet weak var dropShadowLayer: DropShadow! {
        didSet {
            dropShadowLayer.layer.cornerRadius = 25
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
