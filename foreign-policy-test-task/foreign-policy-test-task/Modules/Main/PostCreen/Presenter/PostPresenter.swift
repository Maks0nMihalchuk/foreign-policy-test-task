//
//  PostPresenter.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import Foundation

class PostPresenter: PostPresenterProtocol {

    private let loader = Loader()
    private let model: PostModelProtocol

    weak var view: PostViewProtocol?

    init(_ view: PostViewProtocol?, model: PostModelProtocol) {
        self.view = view
        self.model = model
    }

    func getUrlForLoadRequest() {
        guard let request = model.createdRequest() else { return }

        view?.loadRequest(with: request)
    }

    func startLoader() {
        loader.show()
    }

    func stopLoader() {
        loader.hide()
    }
}
