//
//  NoteApp.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import SwiftUI

@main
struct NoteApp: App {
    var body: some Scene {
        DocumentGroup {
            NoteDocument()
        } editor: { file in
            ContentView(document: file.document)
        }.commands {
            AwesomeCommands()
        }
    }
}


struct DocumentKey: FocusedValueKey {
    typealias Value = NoteDocument
}

extension FocusedValues {
    var document: DocumentKey.Value? {
        get { self[DocumentKey.self] }
        set { self[DocumentKey.self] = newValue }
    }
}
