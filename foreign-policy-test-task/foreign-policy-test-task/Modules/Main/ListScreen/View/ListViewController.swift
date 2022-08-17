//
//  ViewController.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 16.08.2022.
//

import UIKit
import NVActivityIndicatorView
import WebKit

class ListViewController: UIViewController {

    private var webView = WKWebView()
    
    var presenter: ListPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter?.startLoader()
        guard let url = URL(string: "https://foreignpolicy.com/ml-api/v2/list") else { return }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - ListViewProtocol
extension ListViewController: ListViewProtocol {
    
}

// MARK: - WKNavigationDelegate
extension ListViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        presenter?.stopLoader()

    }
}

// MARK: - Setup UI
private extension ListViewController {

    func setupUI() {
        setupWebView()
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
