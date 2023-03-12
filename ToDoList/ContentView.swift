import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    
    @State var newNewTask : String = ""
    @State var newTaskPriority = TaskPriority.red // Default priority is red
    
    var searchBar : some View{
        HStack{
            TextField("Insert New Task", text : self.$newNewTask)
            Button(action: self.addNewNewTask, label: {Text("Add New")})
        }
    }
    
    func addNewNewTask(){
        let newTask = Task(newTask: newNewTask, priority: newTaskPriority)
        taskStore.tasks.append(newTask)
        
        self.newNewTask = ""
        self.newTaskPriority = .red // Reset priority to default
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: $newTaskPriority, label: Text("Priority"), content: {
                    Text("Red").tag(TaskPriority.red)
                    Text("Orange").tag(TaskPriority.orange)
                    Text("Yellow").tag(TaskPriority.yellow)
                    Text("Green").tag(TaskPriority.green)
                }).pickerStyle(SegmentedPickerStyle()).fixedSize()
                HStack{
                    searchBar.padding()
                }
                
                List{
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.newTask)
                            .foregroundColor(getTextColor(for: task.priority))
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.deleteTasks)

                }.navigationTitle("To Do List")
            }.navigationBarItems(trailing: EditButton())
        }
    }
    
    func getTextColor(for priority: TaskPriority) -> Color {
        switch priority {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
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
