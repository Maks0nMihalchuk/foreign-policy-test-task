//
//  MainCoordinator.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

final class MainCoordinator: Coordinator {

    private var builder: MainModuleBuilderProtocol
    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController, builder: MainModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }

    func start() {
        list()
    }

    private func list() {
        let transition = ListTransitions {
            print("show news post")
        }

        let controller = builder.buildListVC(transition: transition)
        setRoot(controller, animated: false)
    }
}
