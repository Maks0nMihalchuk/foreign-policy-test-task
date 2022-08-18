//
//  MainModuleBuilder.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

struct ListTransitions {
    let post: BlockWith<String>
}

class MainModuleBuilder: MainModuleBuilderProtocol {

    func buildListVC(transition: ListTransitions) -> ListViewController {
        let controllerId = String(describing: ListViewController.self)
        let model = ListModel()
        let controller = getViewController(controllerID: controllerId,
                                           storyboardName: .ListStoryboard) as? ListViewController
        guard let viewController = controller else {
            fatalError("Couldn’t instantiate view controller with identifier \(controllerId)")
        }

        let presenter = ListPresenter(controller, model: model, transitions: transition)

        viewController.presenter = presenter
        return viewController
    }

    func buildPostVC(with postID: String) -> PostViewController {
        let controllerId = String(describing: PostViewController.self)
        let model = PostModel(postID: postID)
        let controller = getViewController(controllerID: controllerId,
                                           storyboardName: .PostStoryboard) as? PostViewController
        guard let viewController = controller else {
            fatalError("Couldn’t instantiate view controller with identifier \(controllerId)")
        }

        let presenter = PostPresenter(controller, model: model)

        viewController.presenter = presenter
        return viewController
    }
}
