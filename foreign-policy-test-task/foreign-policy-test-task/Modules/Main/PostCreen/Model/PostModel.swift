//
//  PostModel.swift
//  foreign-policy-test-task
//
//  Created by MaksOn on 18.08.2022.
//

import Foundation

class PostModel: PostModelProtocol {
    private let postID: String
    private let postUrl = "https://foreignpolicy.com/ml-api/v2/post?post_id="

    init(postID: String) {
        self.postID = postID
    }

    func createdRequest() -> URLRequest? {
        let urlString = postUrl + postID
        guard let url = URL(string: urlString) else { return nil }

        return URLRequest(url: url)
    }

    func getPostID() -> String {
        return postID
    }
}
