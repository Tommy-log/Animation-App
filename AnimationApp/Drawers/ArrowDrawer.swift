//
//  ArrowDrawer.swift
//  AnimationApp
//
//  Created by User on 25.08.2021.
//

import UIKit

final class ArrowDrawer: IndicatorDrawable {
    
    func getShapePath(container: UIView) -> CGPath {
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
    
    func getShapeLayer(container: UIView) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.lineJoin = .round
        layer.path = getShapePath(container: container)
        layer.lineWidth = 5
        layer.fillColor = nil
        layer.strokeColor = UIColor.lightGray.cgColor
        return layer
    }
    
    func getIndicatorLayer(container: UIView) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.path = getShapePath(container: container)
        layer.lineJoin = .round
        layer.lineWidth = 3
        layer.lineCap = .round
        layer.fillColor = nil
        layer.strokeColor = UIColor.cyan.cgColor
        layer.strokeEnd = 0
        return layer
    }
    
}
