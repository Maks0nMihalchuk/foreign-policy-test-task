//
//  BuilderProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func getViewController(controllerID id: String, storyboardName name: Storyboard) -> UIViewController
}

extension BuilderProtocol {

    private func getStoryboard(name: Storyboard) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue, bundle: nil)
    }

    func getViewController(controllerID id: String, storyboardName name: Storyboard) -> UIViewController {
        let controller = getStoryboard(name: name)
            .instantiateViewController(withIdentifier: id)

        return controller
    }
}
