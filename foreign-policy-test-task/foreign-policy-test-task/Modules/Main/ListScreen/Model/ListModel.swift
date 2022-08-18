//
//  ListModel.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 17.08.2022.
//

import Foundation

class ListModel: ListModelProtocol {
    private let listUrl = "https://foreignpolicy.com/ml-api/v2/list"
    private let javaScriptEventName = "jsMessenger"
    private let javaScript = """
                window.onload = function() {
                    let id = ""
                    function clickHandler()  {
                        let ctas = document.querySelectorAll('.article-list__wrap');
                        ctas.forEach(cta => {
                            cta.addEventListener('click', (post) => {
                                try {
                                    let elt = post.target.closest("ons-list-item");
                                    let postId = elt.getAttribute('data-ml-post-id');
                                    if (id == postId) { return }
                                    else {
                                        id = postId;
                                    }

                                    window.webkit.messageHandlers.jsMessenger.postMessage(postId);
                                } catch {}
                            });
                        });
                    }

                    var observer = new MutationObserver(function(mutations) {
                        mutations.forEach(function(mutationRecord) {
                            clickHandler()
                        });
                    });
                    var target = document.getElementById('article-list');
                    var observerConfig = {
                        attributes: true,
                        childList: true,
                        characterData: true
                    };
                    observer.observe(target, observerConfig);
                    clickHandler()
                }
                """

    func createdRequest() -> URLRequest? {
        guard let url = URL(string: listUrl) else { return nil }

        return URLRequest(url: url)
    }

    func getScript() -> String {
        return javaScript
    }

    func getJavaScriptEventName() -> String {
        return javaScriptEventName
    }
}
