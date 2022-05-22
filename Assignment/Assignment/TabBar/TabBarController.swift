//
//  TabBarController.swift
//  Assignment Week1
//
//  Created by 이의진 on 2022/05/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        configurationUI()
    }
    //MARK: - UI
    private func configurationUI(){
        let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = .white
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
            tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
            tabBar.isTranslucent = false
    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (tabBar.items!)[2]{
            let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.backgroundColor = .black
                tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.white
                tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
                tabBar.standardAppearance = tabBarAppearance
                tabBar.scrollEdgeAppearance = tabBarAppearance
            
        }else {
            let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.backgroundColor = .white
                tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
                tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
                tabBar.standardAppearance = tabBarAppearance
                tabBar.scrollEdgeAppearance = tabBarAppearance
        }
    }
    
}
