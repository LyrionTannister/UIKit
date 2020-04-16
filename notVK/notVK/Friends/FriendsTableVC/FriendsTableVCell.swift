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
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.shadowLayer.transform = CGAffineTransform(scaleX: -self.shadowLayer.frame.width / 15, y: -self.shadowLayer.frame.height / 15)
        }, completion: { (isComplete) in
            UIView.animate(withDuration: 0.9, animations: {
                self.shadowLayer.transform = .identity
            })
        })
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.myFriendLabel.transform = CGAffineTransform(translationX: -self.frame.width / 10, y: -self.myFriendLabel.frame.height)
        }, completion: { (isComplete) in
            UIView.animate(withDuration: 0.9, animations: {
                self.myFriendLabel.transform = .identity
            })
        })
    }
    
}
