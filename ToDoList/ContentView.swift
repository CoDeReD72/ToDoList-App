//
//  ContentView.swift
//  ToDoList
//
//  Created by Declan Gallagher on 09/03/2023.
//

import SwiftUI
import Combine


struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    
    
    @State var newNewTask : String = ""
    var searchBar : some View{
        HStack{
            TextField("Insert New Task", text : self.$newNewTask)
            Button(action: self.addNewNewTask, label: {Text("Add New")})
        }
    }
    
    func addNewNewTask(){
        taskStore.tasks
            .append(Task(id:String(taskStore.tasks.count + 1), newTask: newNewTask))
        
        self.newNewTask = ""
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List(self.taskStore.tasks){
                    task in
                    Text(task.newTask)
                }.navigationTitle("To Do List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
