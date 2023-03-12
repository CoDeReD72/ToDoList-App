//
//  datastore.swift
//  ToDoList
//
//  Created by Declan Gallagher on 09/03/2023.
//

import Foundation
import SwiftUI
import Combine

enum TaskPriority: String {
    case red = "Urgent and important"
    case orange = "Important"
    case yellow = "Not urgent but important"
    case green = "Low priority"
}

struct Task: Identifiable {
    var id = UUID()
    var newTask: String
    var priority: TaskPriority
}

class TaskStore: ObservableObject {
    @Published var tasks = [Task]()
}
