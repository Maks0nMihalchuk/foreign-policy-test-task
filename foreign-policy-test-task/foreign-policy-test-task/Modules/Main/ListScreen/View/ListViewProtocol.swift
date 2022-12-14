//
//  ListViewProtocol.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 16.08.2022.
//

import Foundation

protocol ListViewProtocol: AnyObject {
    func loadRequest(with request: URLRequest)
    func setupWebViewJavaScriptHandler(with script: String, eventName name: String)
}
