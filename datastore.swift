//
//  datastore.swift
//  ToDoList
//
//  Created by Declan Gallagher on 09/03/2023.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var newTask = String()
}

class TaskStore : ObservableObject{
    @Published var tasks = [Task]()
}
