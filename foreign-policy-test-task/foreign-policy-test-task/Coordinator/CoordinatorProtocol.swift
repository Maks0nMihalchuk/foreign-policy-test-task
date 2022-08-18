//
//  Coordinator.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

typealias VoidCallBack = (() -> Void)
typealias BlockWith<T> = ((T) -> Void)

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }

    func addChildCoordinator(_ coordinator: CoordinatorProtocol)
    func start()
}

// MARK: - Additional functionality
extension CoordinatorProtocol {

    func addChildCoordinator(_ coordinator: CoordinatorProtocol) {
        childCoordinators.forEach { if $0 === coordinator { return } }
        childCoordinators.append(coordinator)
    }

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
