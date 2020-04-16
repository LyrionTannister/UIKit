//
//  RoundedPhotos.swift
//  notVK
//
//  Created by Roman on 04.04.2020.
//  Copyright © 2020 DrewMyScreen. All rights reserved.
//

import UIKit

@IBDesignable
class DropShadow: UIView {
    
    @IBInspectable var color: UIColor = .black {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var opacity: CGFloat = 1 {
        didSet {
            self.updateOpacity()
        }
    }
    @IBInspectable var radius: CGFloat = 7 {
        didSet {
            self.updateRadius()
        }
    }
    @IBInspectable var offset: CGSize = .zero {
        didSet {
            self.updateOffset()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    var shadowLayer: CAShapeLayer {
        return self.layer as! CAShapeLayer
    }
    
    func updateColors() {
        self.layer.shadowColor = self.color.cgColor
    }
    func updateOpacity() {
        self.layer.shadowOpacity = Float(self.opacity)
    }
    func updateRadius() {
        self.layer.shadowRadius = self.radius
    }
    func updateOffset() {
        self.layer.shadowOffset = offset
    }

}
