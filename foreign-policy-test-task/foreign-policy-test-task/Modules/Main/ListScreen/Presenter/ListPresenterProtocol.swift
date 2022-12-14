//
//  ListPresenterProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 16.08.2022.
//

import Foundation

protocol ListPresenterProtocol {
    func startLoader()
    func stopLoader()
    func getUrlForLoadRequest()
    func setupJavaScriptHandler()
    func didTapOnPost(with postID: String)
}
