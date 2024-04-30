//
//  Item.swift
//  Noteyx
//
//  Created by Veronica Natale on 21/11/23.
//

import SwiftData
import Foundation

@Model
class Note {
    
//    var notes: [Note]
    
    @Attribute(.unique) var id: String
    var content: String
    var createdAt: Date
    
    init(id: String, content: String, createdAt: Date) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}


