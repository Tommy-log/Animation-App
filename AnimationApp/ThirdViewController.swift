//
//  ThirdViewController.swift
//  AnimationApp
//
//  Created by User on 23.08.2021.
//

import UIKit

final class ThirdViewController: UIViewController {
    
    // MARK: - Properties
    private let drawer = ArrowDrawer()
    private var arrowLayer: CAShapeLayer?
    private var indicatorArrowLayer: CAShapeLayer?
    
    private lazy var container: UIView = {
       let container = UIView()
        container.backgroundColor = .none
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start Animation", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        arrowLayer?.path = drawer.getShapePath(container: container)
        indicatorArrowLayer?.path = drawer.getShapePath(container: container)
    }
    
    override func viewDidLoad() {
        addSubviews()
        addConstraints()
        addLayer()
    }
    
    //MARK: - Selector
    @objc private func buttonTapped() {
        arrowAnimate()
    }
    
    // MARK: - Private funcs
    private func addLayer() {
        let backgroundLayer = drawer.getShapeLayer(container: container)
        let indicatorLayer = drawer.getIndicatorLayer(container: container)
        container.layer.addSublayer(backgroundLayer)
        container.layer.addSublayer(indicatorLayer)
        self.indicatorArrowLayer = indicatorLayer
        self.arrowLayer = backgroundLayer
    }
    
    private func arrowAnimate() {
        reloadAnim()
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        animation.autoreverses = true
        let secondAnimation = CABasicAnimation(keyPath: "strokeStart")
        secondAnimation.fromValue = 0
        secondAnimation.toValue = 1
        secondAnimation.duration = 0.5
        secondAnimation.autoreverses = true
        secondAnimation.beginTime = CACurrentMediaTime() + 0.5
        indicatorArrowLayer?.add(animation, forKey: "strokeEndAnimation")
        indicatorArrowLayer?.add(secondAnimation, forKey: "strokeStartAnimation")
        view.layoutIfNeeded()
    }
    
    private func addSubviews() {
        view.addSubview(container)
        view.addSubview(startButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 150),
            container.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func reloadAnim() {
        indicatorArrowLayer?.strokeEnd = 0
    }
}
