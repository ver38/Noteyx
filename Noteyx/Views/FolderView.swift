//
//  FolderView.swift
//  Noteyx
//
//  Created by Veronica Natale on 23/11/23.
//

import SwiftUI

struct FolderView: View {
    
    @State var notes: [Note] = [
     ]
    
    @State private var isEditing = false
    
    var body: some View {
    
        NavigationStack {
            VStack {
                List {
                    NavigationLink {NoteListView()
                    } label: {
                        HStack {
                            Image(systemName: "folder")
                                .foregroundStyle(.blue)
                            Text("Notes")
                            Spacer()
                        }
                    }
                }

            }
            .navigationTitle("Folders")
            
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NavigationLink(destination: AddNoteView()) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.blue)
                    }
                }
            }
        } .accentColor(.blue)
    }

}

#Preview {
    FolderView()
}
