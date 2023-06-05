//
//  Extensions.swift
//  ComposableArchitectureProject
//
//  Created by Mark Jones on 05/06/2023.
//

import UIKit

extension UIView {
//    func edgesToSuperview(offset: CGFloat = 0) {
//        horizontalToSuperview(insets: UIEdgeInsets.edgeInsets(vertical: 0, horizontal: offset))
//    }
}

extension UIEdgeInsets {
    static func edgeInsets(vertical: CGFloat, horizontal: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var nonEmpty: Self? {
        return isEmpty ? nil : self
    }
}
