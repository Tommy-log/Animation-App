//
//  Drawer.swift
//  AnimationApp
//
//  Created by User on 17.08.2021.
//

import UIKit

final class Drawer {
    
    func getCircleShapePath(container: UIView) -> CGPath {
        UIBezierPath(
            arcCenter: container.center,
            radius: container.frame.height / 2,
            startAngle: 3 * CGFloat.pi / 4,
            endAngle: CGFloat.pi / 4,
            clockwise: true
        ).cgPath
    }
    
    func getCircleShapeLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getCircleShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 8
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.gray.cgColor
        return shapeLayer
    }
    
    func getCircleIndicatorLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getCircleShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 8
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = nil
        return shapeLayer
    }
}
