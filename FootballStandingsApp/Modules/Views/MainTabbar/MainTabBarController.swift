//
//  MainTabBarController.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backButton = UIBarButtonItem()
//           backButton.title = "Назад"
//           navigationItem.backBarButtonItem = backButton
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        let mainVc = UINavigationController(rootViewController: MainViewController())
        let tabItem1 = UITabBarItem(title: "Главная",
                                            image: UIImage(named: "house"),
                                            selectedImage: UIImage(named: "house"))
        
        mainVc.tabBarItem = tabItem1
//        let tabbar = UITabBarController()
        
        let searchBarVc = UINavigationController(rootViewController: SearchBarViewController())
        let tabItem2 = UITabBarItem(title: "Поиск",
                                            image: UIImage(named: "magnifyingglass"),
                                            selectedImage: UIImage(named: "magnifyingglass"))

        searchBarVc.tabBarItem = tabItem2
        
        
        let favouritesVc = UINavigationController(rootViewController: FavouritesViewController())
        let tabItem3 = UITabBarItem(title: "Избранное",
                                            image: UIImage(named: "star.fill"),
                                            selectedImage: UIImage(named: "star.fill"))
        
        favouritesVc.tabBarItem = tabItem3
        
        let aboutUsVc = UINavigationController(rootViewController: AboutUsViewController())
        let tabItem4 = UITabBarItem(title: "О нас",
                                            image: UIImage(named: "soccerball"),
                                            selectedImage: UIImage(named: "soccerball"))
        
        aboutUsVc.tabBarItem = tabItem4
        
        viewControllers = [mainVc, searchBarVc, favouritesVc, aboutUsVc]
//        tabBar.backgroundColor = .systemBackground
        tabBar.backgroundColor = .white
    }
}
