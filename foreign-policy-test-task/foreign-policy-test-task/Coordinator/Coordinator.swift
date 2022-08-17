//
//  Coordinator.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

typealias VoidCallBack = (() -> Void)

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }

    func start()
}

// MARK: - Additional functionality
extension Coordinator {

    func setRoot(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController.setViewControllers([viewController], animated: animated)
    }

    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }
}
