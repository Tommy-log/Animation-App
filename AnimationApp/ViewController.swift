//
//  ViewController.swift
//  AnimationApp
//
//  Created by User on 15.08.2021.
//

import UIKit

class ViewController: UIViewController {
        
    private lazy var heightConstraint = circle.heightAnchor.constraint(equalToConstant: 200)
    private lazy var widthConstraint = circle.widthAnchor.constraint(equalToConstant: 200)
    private lazy var square: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var circle: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = view.frame.height / 2
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(animateTapOnCircle))
        view.addGestureRecognizer(gesture)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circle.layer.cornerRadius = circle.frame.height / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
    }
    
    @objc private func animateTapOnCircle() {
        view.layoutSubviews()
        let initialConstant = heightConstraint.constant
        UIView.animate(withDuration: 0.1, delay: 0, options: .autoreverse) {
            self.heightConstraint.constant = initialConstant / 1.3
            self.widthConstraint.constant = initialConstant / 1.3
            self.heightConstraint.isActive = true
            self.widthConstraint.isActive = true
            self.circle.backgroundColor = .black
            self.view.layoutSubviews()
        } completion: {
            if $0 {
                self.heightConstraint.constant = initialConstant
                self.widthConstraint.constant = initialConstant
                self.circle.layer.cornerRadius = initialConstant / 2
                self.circle.backgroundColor = .red
                self.view.layoutSubviews()
            }
        }

    }
    
    private func addSubviews() {
        view.addSubview(circle)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            circle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            heightConstraint,
            widthConstraint
        ])
    }
}

