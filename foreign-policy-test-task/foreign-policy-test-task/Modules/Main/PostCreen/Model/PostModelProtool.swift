//
//  PostModelProtool.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import Foundation

protocol PostModelProtocol {
    func createdRequest() -> URLRequest?
    func getPostID() -> String
}
