//
//  TabBarControllerAssembly.swift
//  AnimationApp
//
//  Created by User on 25.08.2021.
//

import UIKit

final class TabBarControllerAssembly {
    
    private let tabBarController = UITabBarController()
    
    
    func getInstance() -> UITabBarController {
        tabBarController.selectedIndex = 2
        tabBarController.setViewControllers(getViewControllers(),
                                            animated: false)
        return tabBarController
    }
    
    private func getViewControllers() -> [UIViewController] {
        let firstViewController = ViewController()
        firstViewController.title = "first"
        firstViewController.tabBarItem.image = UIImage(systemName: "1.square")
        let secondViewController = SecondViewController()
        secondViewController.title = "second"
        secondViewController.tabBarItem.image = UIImage(systemName: "2.square")
        let thirdViewController = ThirdViewController()
        thirdViewController.title = "third"
        thirdViewController.tabBarItem.image = UIImage(systemName: "3.square")
        
       return [
        firstViewController,
        secondViewController,
        thirdViewController
        ]
    }
}
