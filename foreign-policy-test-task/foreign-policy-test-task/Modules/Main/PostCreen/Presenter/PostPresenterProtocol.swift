//
//  PostPresenterProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import Foundation

protocol PostPresenterProtocol {
    func getUrlForLoadRequest()
    func startLoader()
    func stopLoader()
}
