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
        DocumentGroup(newDocument: NoteDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
