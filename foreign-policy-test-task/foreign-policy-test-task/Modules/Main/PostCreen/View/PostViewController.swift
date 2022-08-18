//
//  PostViewController.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import UIKit
import WebKit

class PostViewController: UIViewController {

    private var webView = WKWebView()

    var presenter: PostPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.startLoader()
        presenter?.getUrlForLoadRequest()
    }
}

// MARK: - PostViewProtocol
extension PostViewController: PostViewProtocol {

    func loadRequest(with request: URLRequest) {
        webView.load(request)
    }
}

// MARK: - WKNavigationDelegate
extension PostViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        presenter?.stopLoader()
    }
}

// MARK: - setupUI
private extension PostViewController {

    func setupUI() {
        setupNavigationBar()
        setupWebView()
    }

    func setupNavigationBar() {
        self.title = "Post"
    }

    func setupWebView() {
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
