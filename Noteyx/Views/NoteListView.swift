//
//  AddNoteView.swift
//  Noteyx
//
//  Created by Veronica Natale on 21/11/23.
//

import SwiftData
import SwiftUI

struct NoteListView: View {
    
    @Environment(\.modelContext) private var context
    @Query(sort: \Note.createdAt, order: .reverse) var allNotes: [Note]
    @State private var noteText: String = ""
    // Hey Jude, don't make it bad
    
var body: some View {
    NavigationStack {
        List{
            Section {
                if allNotes.isEmpty {
                    ContentUnavailableView("nothing added yet", systemImage: "note")
                            .font(.caption)
                } else {
                    ForEach(allNotes) {note in
                        VStack(alignment: .leading) {
                            Text(note.content)
                            Text(note.createdAt, style: .time)
                                .font(.caption)
                             } // v stack
                        } // for each
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            context.delete(allNotes[index])
                        }
                        try? context.save()
                      } // ondelete
                    } // else
                } // section
            } // list
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: AddNoteView()) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            } // toolbar
        }
    }
    
    func createNote() {
        let note = Note(id: UUID().uuidString, content: noteText, createdAt: .now)
        context.insert(note)
        try? context.save()
        
    }
    
}

#Preview {
    NoteListView()
}
