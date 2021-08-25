//
//  SecondViewController.swift
//  AnimationApp
//
//  Created by User on 18.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let drawer = CircleDrawer()
    private var backgroundLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    
    private lazy var durationTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "duration"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var procentTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "procent"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var progresLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial", size: 32)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var square: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var startAnimButton: UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(targetForButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundLayer?.path = drawer.getShapePath(container: square)
        progressLayer?.path = drawer.getShapePath(container: square)
    }
    
    override func viewDidLoad() {
        addSubviews()
        addConstraints()
        addLayer()
    }
    
    private func addSubviews() {
        view.addSubview(square)
        view.addSubview(progresLabel)
        view.addSubview(startAnimButton)
        view.addSubview(durationTextField)
        view.addSubview(procentTextField)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            square.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            square.heightAnchor.constraint(equalToConstant: 100),
            square.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            progresLabel.centerYAnchor.constraint(equalTo: square.centerYAnchor),
            progresLabel.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            progresLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            startAnimButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startAnimButton.widthAnchor.constraint(equalToConstant: 100),
            startAnimButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startAnimButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            durationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            durationTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            durationTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            procentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            procentTextField.topAnchor.constraint(equalTo: durationTextField.bottomAnchor, constant: 20),
            procentTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            procentTextField.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    private func addLayer() {
        let backgroundLayer = drawer.getShapeLayer(container: square)
        let progressLayer = drawer.getIndicatorLayer(container: square)
        view.layer.addSublayer(backgroundLayer)
        view.layer.insertSublayer(progressLayer, above: backgroundLayer)
        self.backgroundLayer = backgroundLayer
        self.progressLayer = progressLayer
    }
    
    private func animationForIndicatorLayer(duration: TimeInterval, progress: Int) {
        let progress = CGFloat(Double(progress) / 100.0)
        progressLayer?.strokeEnd = progress
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.byValue = progress
        strokeEndAnimation.duration = duration
        progressLayer?.add(strokeEndAnimation, forKey: "strokeEndAnimation")
        self.view.layoutIfNeeded()
    }
    
    private func animationColorIndicator(duration: TimeInterval, progress: Int) {
        let colors = getArrayColors(progress: progress)
        progressLayer?.strokeColor = colors.last
        let strokeColorAnimation = CAKeyframeAnimation(keyPath: "strokeColor")
        strokeColorAnimation.values = colors
        strokeColorAnimation.duration = duration
        strokeColorAnimation.isAdditive = true
        progressLayer?.add(strokeColorAnimation, forKey: "strokeColor")
        self.view.layoutIfNeeded()
    }
    
    @objc private func targetForButton() {
        resetProgress()
        guard let duration = TimeInterval(durationTextField.text ?? ""),
              let progress = Int(procentTextField.text ?? ""),
              progress >= 0, progress <= 100 else { return }
        animationForIndicatorLayer(duration: duration, progress: progress)
        animationColorIndicator(duration: duration, progress: progress)
        progresLabel.text = "\(progress)"
    }
    
    private func resetProgress() {
        progresLabel.text = ""
        progressLayer?.strokeEnd = 0
        progressLayer?.strokeColor = nil
        progressLayer?.removeAllAnimations()
    }
    
    private func getArrayColors(progress: Int) -> [CGColor] {
        switch progress {
        case 0...25:
            return [UIColor.systemRed.cgColor]
        case 26...60:
            return [UIColor.systemRed.cgColor, UIColor.systemOrange.cgColor]
        case 61...100:
            return [UIColor.systemRed.cgColor, UIColor.systemOrange.cgColor, UIColor.systemGreen.cgColor]
        default:
            return []
        }
    }
}
