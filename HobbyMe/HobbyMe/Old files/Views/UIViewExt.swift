//
//  UIViewExt.swift
//  HobbyMe
//
//  Created by Matthew Serna on 12/6/20.
//

import Foundation
import UIKit

extension UIView {
    func constrain(toFill view: UIView, padding: CGFloat = 0.0) {
        
        // Top & bottom
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding).isActive = true
        
        // Leading & trailing
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
    }
}
