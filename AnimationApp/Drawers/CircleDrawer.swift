//
//  CircleDrawer.swift
//  AnimationApp
//
//  Created by User on 25.08.2021.
//

import UIKit

final class CircleDrawer: IndicatorDrawable {
    
    func getShapePath(container: UIView) -> CGPath {
        UIBezierPath(
            arcCenter: container.center,
            radius: container.frame.height / 2,
            startAngle: 3 * CGFloat.pi / 4,
            endAngle: CGFloat.pi / 4,
            clockwise: true
        ).cgPath
    }
    
    func getShapeLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 4
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        return shapeLayer
    }
    
    func getIndicatorLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 4
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = nil
        return shapeLayer
    }
}
