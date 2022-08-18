//
//  ListModelProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import Foundation

protocol ListModelProtocol {
    func createdRequest() -> URLRequest?
    func getScript() -> String
    func getJavaScriptEventName() -> String
}
