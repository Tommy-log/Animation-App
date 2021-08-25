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
    
    func getArrowShapePath(container: UIView) -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: container.bounds.midX, y: container.bounds.minY))
        path.addLine(to: CGPoint(x: container.bounds.maxX,
                                 y: container.bounds.maxY))
        path.addLine(to: CGPoint(x: container.bounds.midX,
                                 y: 3 * container.bounds.maxY / 4))
        path.addLine(to: CGPoint(x: container.bounds.minX,
                                 y: container.bounds.maxY))
        path.close()
        return path.cgPath
    }
    
    func getBackgroundArrowShapeLayer(container: UIView) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.lineJoin = .round
        layer.path = getArrowShapePath(container: container)
        layer.lineWidth = 6
        layer.fillColor = nil
        layer.strokeColor = UIColor.lightGray.cgColor
        return layer
    }
    
    func getIndicatorArrowShapeLayer(container: UIView) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = getArrowShapePath(container: container)
        layer.lineJoin = .round
        layer.lineWidth = 6
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeColor = UIColor.green.cgColor
        layer.strokeEnd = 0.5
        return layer
    }
    
    func getCircleShapeLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getCircleShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 4
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        return shapeLayer
    }
    
    func getCircleIndicatorLayer(container: UIView) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getCircleShapePath(container: container)
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 4
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = nil
        return shapeLayer
    }
}
