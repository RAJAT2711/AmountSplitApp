//
//  ContentView.swift
//  AmountSplitApp
//
//  Created by Rajat Gupta on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var noOfPeople = 2
    @State private var percentageTip = 2
    let percentageTips = [5,10,15,20,0]
    var totalPerPerson : Double{
        
        let peopleCount = Double(noOfPeople+2)
        let tipSelection = Double(percentageTips[percentageTip])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text : $checkAmount).keyboardType(.decimalPad)
                    Picker("Number of people",selection:$noOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip you want to leave?")){
                    Picker("Select percentage", selection: $percentageTip){
                        ForEach(0..<percentageTips.count){
                            Text("\(self.percentageTips[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        }.navigationTitle("Amount Split").navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
