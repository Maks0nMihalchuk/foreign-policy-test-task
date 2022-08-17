//
//  MainModuleBuilderProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import UIKit

protocol MainModuleBuilderProtocol: BuilderProtocol {

    func buildListVC(transition: ListTransitions) -> ListViewController
}
