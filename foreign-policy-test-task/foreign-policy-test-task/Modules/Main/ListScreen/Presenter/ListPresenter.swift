//
//  ListPresenter.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 16.08.2022.
//

import Foundation

class ListPresenter: ListPresenterProtocol {

    private let loader = Loader()
    private let model: ListModel
    private var transitions: ListTransitions

    weak var view: ListViewProtocol?

    init(_ view: ListViewProtocol?, model: ListModel, transitions: ListTransitions) {
        self.view = view
        self.model = model
        self.transitions = transitions
    }

    func startLoader() {
        loader.show()
    }

    func stopLoader() {
        loader.hide()
    }
}
