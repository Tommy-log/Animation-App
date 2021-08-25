//
//  TabBarControllerAssembly.swift
//  AnimationApp
//
//  Created by User on 25.08.2021.
//

import UIKit

final class TabBarControllerAssembly {
    
    private let drawer = Drawer()
    private let tabBarController = UITabBarController()
    
    
    func getInstance() -> UITabBarController {
        tabBarController.selectedIndex = 2
        tabBarController.setViewControllers(getViewControllers(),
                                            animated: false)
        addBarItemsForViewController()
        return tabBarController
    }
    
    private func addBarItemsForViewController() {
        let viewControllers = getViewControllers()
        let items = getBarItems()
        
        for i in 0..<viewControllers.count {
            viewControllers[i].tabBarItem = items[i]
        }
    }
    
    private func getBarItems() -> [UITabBarItem] {
        let items = [
            UITabBarItem(title: "first", image: UIImage(systemName: "1.square"), tag: 0),
            UITabBarItem(title: "second", image: UIImage(systemName: "2.square"), tag: 1),
            UITabBarItem(title: "third", image: UIImage(systemName: "3.square"), tag: 2)
        ]
        return items
    }
    
    private func getViewControllers() -> [UIViewController] {
        let firstViewController = ViewController()
        firstViewController.title = "first"
        firstViewController.tabBarItem.image = UIImage(systemName: "1.square")
        let secondViewController = SecondViewController()
        secondViewController.title = "second"
        secondViewController.tabBarItem.image = UIImage(systemName: "2.square")
        let thirdViewController = ThirdViewController(drawer: drawer)
        thirdViewController.title = "third"
        thirdViewController.tabBarItem.image = UIImage(systemName: "3.square")
       return [
        firstViewController,
        secondViewController,
        thirdViewController
        ]
    }
}
