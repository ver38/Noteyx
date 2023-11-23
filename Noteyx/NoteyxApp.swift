//
//  NoteyxApp.swift
//  Noteyx
//
//  Created by Veronica Natale on 21/11/23.
//

import SwiftUI
import SwiftData

@main
struct NoteyxApp: App {


    var body: some Scene {
        WindowGroup {
            FolderView()
        }
        .modelContainer(for: [
            Note.self
        ])
    }
}



