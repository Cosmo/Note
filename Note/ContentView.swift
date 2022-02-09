//
//  ContentView.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var document: NoteDocument

    var body: some View {
        VStack(alignment: .leading) {
            Toggle("Awesome Lock", isOn: $document.isAwesomeLocked)
                .padding()
            
            Divider()
            
            VStack(alignment: .leading) {
                Toggle("Is Awesome?", isOn: $document.post.isAwesome)
                    .padding()
                    .disabled(!document.isAwesomeLocked)
                Text(document.post.isAwesome ? "This document is awesome." : "This document is NOT awesome.")
                    .padding()
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                TextField("Title", text: $document.post.title)
                TextEditor(text: $document.post.body)
            }
        }
        .focusedSceneValue(\.document, document)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: NoteDocument())
    }
}
