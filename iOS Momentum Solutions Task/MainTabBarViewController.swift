//
//  MainTabBarViewController.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 23/07/2025.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        let VC1 = UINavigationController(rootViewController: HomeViewController())
        let VC2 = UINavigationController(rootViewController: UpComingViewController())
        let VC3 = UINavigationController(rootViewController: SearchViewController())

        VC1.tabBarItem.image = UIImage(systemName: "house")
        VC2.tabBarItem.image = UIImage(systemName: "play.circle")
        VC3.tabBarItem.image = UIImage(systemName: "magnifyingglass")

        VC1.title = "Home"
        VC2.title = "Coming Soon"
        VC3.title = "Top Search"

        tabBar.tintColor = .label
        
        setViewControllers([VC1,VC2,VC3], animated: true)
    }


}

