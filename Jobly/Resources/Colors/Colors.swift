//
//  Colors.swift
//  Jobly
//
//  Created by Jyferson Colina on 22/03/22.
//

import UIKit

struct Colors {
    static var primaryColor = UIColor(red: 55/255, green: 83/255, blue: 243/255, alpha: 1)
    static var secondaryColor = UIColor(red: 89/255, green: 134/255, blue: 245/255, alpha: 1)
    static var superLigthGary = UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 0.1)
}

extension UIColor {
    static func addGradient(view: UIView, leadingColor: UIColor, trailingColor: UIColor) -> UIColor? {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.type = .axial
        gradient.colors = [leadingColor.cgColor, trailingColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        return nil
    }
}
