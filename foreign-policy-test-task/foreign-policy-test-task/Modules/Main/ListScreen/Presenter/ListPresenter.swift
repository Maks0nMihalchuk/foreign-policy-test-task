//
//  ListPresenter.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 16.08.2022.
//

import Foundation

class ListPresenter: ListPresenterProtocol {

    private let loader = Loader()
    private let model: ListModelProtocol
    private var transitions: ListTransitions

    weak var view: ListViewProtocol?

    init(_ view: ListViewProtocol?, model: ListModelProtocol, transitions: ListTransitions) {
        self.view = view
        self.model = model
        self.transitions = transitions
    }

    func didTapOnPost(with postID: String) {
        transitions.post(postID)
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

    func setupJavaScriptHandler() {
        let script = model.getScript()
        let javaScriptEventName = model.getJavaScriptEventName()
        view?.setupWebViewJavaScriptHandler(with: script, eventName: javaScriptEventName)
    }
}
