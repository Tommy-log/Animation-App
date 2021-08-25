//
//  Drawable.swift
//  AnimationApp
//
//  Created by User on 25.08.2021.
//

import UIKit

protocol Drawable {
    func getShapePath(container: UIView) -> CGPath
    func getShapeLayer(container: UIView) -> CAShapeLayer
}

protocol IndicatorDrawable: Drawable {
    func getIndicatorLayer(container: UIView) -> CAShapeLayer
}
