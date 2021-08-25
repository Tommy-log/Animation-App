//
//  ThirdViewController.swift
//  AnimationApp
//
//  Created by User on 23.08.2021.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    var drawer: Drawer
    var arrowLayer: CAShapeLayer?
    var indicatorArrowLayer: CAShapeLayer?
    
    private lazy var container: UIView = {
       let container = UIView()
        container.backgroundColor = .none
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    init(drawer: Drawer) {
        self.drawer = drawer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrowLayer?.path = drawer.getArrowShapePath(container: container)
        indicatorArrowLayer?.path = drawer.getArrowShapePath(container: container)
    }
    
    override func viewDidLoad() {
        addSubviews()
        addConstraints()
        addLayer()
        arrowAnimate()
    }
    
    private func addLayer() {
        let backgroundLayer = drawer.getBackgroundArrowShapeLayer(container: container)
        let indicatorLayer = drawer.getIndicatorArrowShapeLayer(container: container)
        container.layer.addSublayer(backgroundLayer)
        container.layer.addSublayer(indicatorLayer)
        self.indicatorArrowLayer = indicatorLayer
        self.arrowLayer = backgroundLayer
    }
    
    private func arrowAnimate() {
        reloadAnim()
        //indicatorArrowLayer?.strokeEnd = 1
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.repeatCount = 1
        animation.duration = 2
        let secondAnimation = CABasicAnimation(keyPath: "strokeStart")
        secondAnimation.fromValue = 0
        secondAnimation.toValue = 1
        secondAnimation.repeatCount = 1
        secondAnimation.duration = 3
        indicatorArrowLayer?.add(animation, forKey: "strokeEndAnimation")
        indicatorArrowLayer?.add(secondAnimation, forKey: "strokeStartAnimation")
        view.layoutIfNeeded()
    }
    
    private func addSubviews() {
        view.addSubview(container)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 150),
            container.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func reloadAnim() {
        indicatorArrowLayer?.strokeEnd = 0
    }
}
