//
//  ContentView.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var document: NoteDocument
    @Environment(\.undoManager) var undoManager

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
        .focusedSceneValue(\.document, $document)
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                HStack {
                    undoButton
                    redoButton
                }
            }
        }
    }
    
    var undoButton: some View {
        Button(action: {
            withAnimation {
                undoManager?.undo()
            }
        }) {
            Image(systemName: "arrow.uturn.backward.circle.fill")
        }
        .buttonStyle(BorderlessButtonStyle())
        .disabled(!(undoManager?.canUndo ?? false))
    }
    
    var redoButton: some View {
        Button(action: {
            withAnimation {
                undoManager?.redo()
            }
        }) {
            Image(systemName: "arrow.uturn.forward.circle.fill")
        }
        .buttonStyle(BorderlessButtonStyle())
        .disabled(!(undoManager?.canRedo ?? false))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: NoteDocument())
    }
}
