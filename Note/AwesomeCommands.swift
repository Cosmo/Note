//
//  AwesomeCommands.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import Foundation
import SwiftUI

struct AwesomeCommands: Commands {
    @FocusedBinding(\.document) private var document: NoteDocument?
    
    var body: some Commands {
        CommandMenu("Awesome") {
            Button("Toggle Awesome") {
                document?.post.isAwesome.toggle()
            }.disabled(!(document?.isAwesomeLocked ?? true))
        }
    }
}
