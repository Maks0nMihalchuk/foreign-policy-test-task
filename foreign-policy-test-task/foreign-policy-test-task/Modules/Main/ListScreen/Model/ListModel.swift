//
//  ListModel.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import Foundation

protocol ListModelProtocol {
    func createdRequest() -> URLRequest?
}

struct ListModel: ListModelProtocol {
    private let listUrl = "https://foreignpolicy.com/ml-api/v2/list"

    func createdRequest() -> URLRequest? {
        guard let url = URL(string: listUrl) else { return nil }

        return URLRequest(url: url)
    }
}
