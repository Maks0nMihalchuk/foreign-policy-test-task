//
//  AppCoordinator.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

final class AppCoordinator: Coordinator {

    var window: UIWindow
    var navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    func start() {
        mainFlow()
    }

    private func mainFlow() {
        let builder = MainModuleBuilder()
        let mainCoordinator = MainCoordinator(navigationController, builder: builder)
        mainCoordinator.start()
    }
}
