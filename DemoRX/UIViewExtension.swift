//
//  UIViewExtension.swift
//  TTCFaceID
//
//  Created by TrungNV on 3/10/20.
//  Copyright © 2020 ttc-solutions. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
           get {
               return layer.borderWidth
           }
           set {
               layer.borderWidth = newValue
           }
       }

    @IBInspectable var borderColor: UIColor {
           get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor)
           }
           set {
            layer.borderColor = newValue.cgColor
           }
       }
    
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func createShadow(scale: Bool = true, color shadowColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), radius: CGFloat = 5.0) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
     func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
    
    func roundCorners(cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
    func hideAnimated(in stackView: UIStackView) {
        if !self.isHidden {
            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    self.isHidden = true
                    stackView.layoutIfNeeded()
            },
                completion: nil
            )
        }
    }
    
    func showAnimated(in stackView: UIStackView) {
        if self.isHidden {
            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    self.isHidden = false
                    stackView.layoutIfNeeded()
            },
                completion: nil
            )
        }
    }
    
    func rounderCorner(radius: Bool) {
        if radius {
            layer.cornerRadius = frame.width < frame.height ? frame.width * 0.5 : frame.height * 0.5
        } else {
            layer.cornerRadius = 0
        }
        contentMode = .scaleToFill
        layer.masksToBounds = true
    }
    
}

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var circre: Bool = false
    @IBInspectable var isShadow: Bool = false
    @IBInspectable var cornerRadiusView: Double = 0
    override func layoutSubviews() {
        super.layoutSubviews()
        if isShadow {
            createShadow()
        }
        rounderCorner(radius: circre)
        roundCorners(cornerRadius: cornerRadiusView)
    }
}

@IBDesignable
class DesignableButton: UIButton {
    @IBInspectable var circle: Bool = false
    override func layoutSubviews() {
        super.layoutSubviews()
        rounderCorner(radius: circle)
    }
}

@IBDesignable
class DesignableLabel: UILabel {
    @IBInspectable var circle: Bool = false
    override func layoutSubviews() {
        super.layoutSubviews()
        rounderCorner(radius: circle)
    }
}

@IBDesignable
class DesignableImageView: UIImageView {
    @IBInspectable var circleView: Bool = false
    override func layoutSubviews() {
        super.layoutSubviews()
        rounderCorner(radius: circleView)
    }
}



