//
//  VKCupTabBarController.swift
//  VKCupRound2IOS
//
//  Created by Артем Галай on 16.01.23.
//

import UIKit

final class VKCupTabBarController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewControllers()
    }

    // MARK: - Private methods

    private func setupTabBarController() {
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .systemGray5
    }

    private func setupTabBarViewControllers() {

        let first = Task1()
        let firstIcon = UITabBarItem(title: "Task1", image: UIImage(systemName: "text.justify"), selectedImage: UIImage(systemName: "text.justify"))
        first.tabBarItem = firstIcon

        let second = Task2()
        let secondIcon = UITabBarItem(title: "Task2", image: UIImage(systemName: "list.dash"), selectedImage: UIImage(systemName: "list.dash"))
        second.tabBarItem = secondIcon

        let third = Task3()
        let thirdIcon = UITabBarItem(title: "Task3", image: UIImage(systemName: "text.insert"), selectedImage: UIImage(systemName: "text.insert"))
        third.tabBarItem = thirdIcon

        let fourth = Task4()
        let fourthIcon = UITabBarItem(title: "Task4", image: UIImage(systemName: "text.append"), selectedImage: UIImage(systemName: "text.append"))
        fourth.tabBarItem = fourthIcon

        let five = Task5()
        let fiveIcon = UITabBarItem(title: "Task5", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        five.tabBarItem = fiveIcon

        let controllers = [first, second, third, fourth, five]
        self.setViewControllers(controllers, animated: true)
    }
}
