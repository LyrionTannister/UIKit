//
//  GroupsViewCell.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

final class RoundedView: UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
        
        let maskLayer = CAShapeLayer()
        let roundPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 50, height: 50))
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        layer.cornerRadius = bounds.height / 2
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.9
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize.zero
//    }
}

class GroupsViewCell: UITableViewCell {
    

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var myGroupLabel: UILabel!
    @IBOutlet weak var myGroupPic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
