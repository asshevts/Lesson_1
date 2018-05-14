//
//  UIView+Layer.swift
//  Lesson_1
//
//  Created by Анастасия Шевцова on 11.05.2018.
//  Copyright © 2018 Анастасия Шевцова. All rights reserved.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
