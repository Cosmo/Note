//
//  ContentView.swift
//  Note
//
//  Created by Devran on 09.02.22.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: NoteDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(NoteDocument()))
    }
}
