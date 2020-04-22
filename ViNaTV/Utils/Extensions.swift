//
//  Extensions.swift
//  ViNaTV
//
//  Created by Alan Silva on 20/04/20.
//  Copyright © 2020 Alan Silva. All rights reserved.
//

import Foundation
import UIKit

//MARK: - EXTENSIONS UIBUTTON
extension UIButton {
    
    func setGradientToButton(colorOne: UIColor, colorTwo: UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func formatUIButton(){
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.masksToBounds = true
    }

}

extension UIView {
    public func setAnchorPoint(to point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
    
    public func prepareForFadeAnimate() {
        transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        alpha = 0
    }
    
    public func fadeInAnimate(withDuration duration: TimeInterval = 0.15, delay: TimeInterval = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }, completion: completion)
    }
    
    public func fadeOutAnimate(withDuration duration: TimeInterval = 0.15, delay: TimeInterval = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            self.alpha = 0
        }, completion: completion)
    }
    
    public func dropShadow() {
        layer.shadowOpacity = 0.16
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    public func removeShadow() {
        layer.shadowOpacity = 0
        layer.shadowColor = nil
        layer.shadowRadius = 0
        layer.shadowOffset = .zero
    }
}

extension UIButton {
    
    public func addDropShadow(){
        
        layer.shadowOpacity = 1.16
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 1)
        
    }
    
}

extension UserDefaults {
    
    func setLoggedInState(value: Bool) {
        set(value, forKey: "isLoggedIn")
        synchronize()
    }
    
    func getLoggedInState() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
}
