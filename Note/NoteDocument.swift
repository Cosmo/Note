//
//  NoteDocument.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
}

class NoteDocument: ReferenceFileDocument {
    typealias Snapshot = Post
    
    @Published var post: Post
    @Published var isAwesomeLocked: Bool = false
    
    init(post: Post = Post()) {
        self.post = post
    }
    
    func snapshot(contentType: UTType) throws -> Post {
        post
    }
    
    static var readableContentTypes: [UTType] { [.exampleText] }
    
    required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.post = try JSONDecoder().decode(Post.self, from: data)
    }
    
    func fileWrapper(snapshot: Post, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(post)
        let fileWrapper = FileWrapper(regularFileWithContents: data)
        return fileWrapper
    }
}
