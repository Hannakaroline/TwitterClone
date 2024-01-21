//
//  MainTabBarViewController.swift
//  TwitterClone
//
//  Created by Hanna on 21/01/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let hvc = UINavigationController(rootViewController: HomeViewController())
        let svc = UINavigationController(rootViewController: SearchViewController())
        let nvc = UINavigationController(rootViewController: NotificationsViewController())
        let dvc = UINavigationController(rootViewController: DirectMessagesViewController())
        
        hvc.tabBarItem.image = UIImage(systemName: "house")
        hvc.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        svc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
       
        nvc.tabBarItem.image = UIImage(systemName: "bell")
        nvc.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        dvc.tabBarItem.image = UIImage(systemName: "envelope")
        dvc.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([hvc, svc, nvc, dvc], animated: true)
    }
}
