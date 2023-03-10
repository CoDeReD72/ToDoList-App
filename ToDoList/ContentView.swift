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
                List{
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.newTask)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.deleteTasks)

                }.navigationTitle("To Do List")
            }.navigationBarItems(trailing: EditButton())
        }
    }
    func move (from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func deleteTasks(at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
