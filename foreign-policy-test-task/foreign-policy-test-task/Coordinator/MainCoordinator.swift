//
//  MainCoordinator.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

final class MainCoordinator: CoordinatorProtocol {

    private var builder: MainModuleBuilderProtocol

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorProtocol]

    init(_ navigationController: UINavigationController, builder: MainModuleBuilderProtocol) {
        self.childCoordinators = []
        self.navigationController = navigationController
        self.builder = builder
    }

    func start() {
        list()
    }

    private func list() {
        let transition = ListTransitions { [weak self] postID in
            self?.showPostScreen(with: postID)
        }

        let controller = builder.buildListVC(transition: transition)
        setRoot(controller, animated: false)
    }

    private func showPostScreen(with postID: String) {
        let controller = builder.buildPostVC(with: postID)
        push(controller)
    }
}
