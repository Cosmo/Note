//
//  Post.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import Foundation

struct Post: Codable {
    var title: String = "Title"
    var body: String = "Body"
    var isAwesome: Bool = false
}
