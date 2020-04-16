//
//  FriendsTableViewCell.swift
//  notVK
//
//  Created by Roman on 02.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowLayer: ImageRoundedShadowed!
    @IBOutlet weak var myFriendLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapOn(_:)))
        shadowLayer.addGestureRecognizer(tap)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @objc func tapOn(_ tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [.repeat,.autoreverse],
                       animations: {
                        self.shadowLayer.transform = CGAffineTransform(scaleX: -self.shadowLayer.bounds.width / 2, y: -self.shadowLayer.bounds.height / 2)
        })
    }

}
