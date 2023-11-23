//
//  AddNoteView.swift
//  Noteyx
//
//  Created by Veronica Natale on 23/11/23.
//

import SwiftData
import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.createdAt, order: .reverse) var allNotes: [Note]
    @State private var noteText: String = ""
    
    func createNote() {
            let note = Note(id: UUID().uuidString, content: noteText, createdAt: .now)
            context.insert(note)
            try? context.save()
    
        }
    
    var body: some View {
        NavigationStack{
            VStack{
                TextEditor(text: $noteText)
                  .padding()
            }
        }
        .toolbar {
                      ToolbarItem {
                          Button() {
                              createNote()
                              print("about tapped!")
      
                          } label: {
                              Text("Done")
                                  .fontWeight(.bold)
                          }
                      }
                  } // end of toolbar
                  .navigationTitle("New Note")
    }
}

#Preview {
    AddNoteView()
}
