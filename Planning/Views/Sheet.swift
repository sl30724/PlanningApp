//
//  AddPopUp.swift
//  Planning
//
//  Created by Sandy Lee on 10/18/22.
//

import SwiftUI


struct Sheet: View {
    @State private var SheetShow = false
    @State private var taskDate = Date()
    @State private var taskStartTime = Date()
    @State private var taskEndTime = Date()
    @State var taskName: String = ""
    @State private var allDay = false
    @State private var category = "Purple"
    let Categories = ["Purple", "Pink", "Green", "Blue"]
//    @State private var selfcareChecked = false
    var body: some View {
        Button("Add") {
            SheetShow = true
        }
        .sheet(isPresented: $SheetShow){
            VStack{
                HStack{
                    Button("Cancel", role: .cancel){
                        SheetShow = false
                    }
                    .foregroundColor(.red)
                    .frame(alignment: .leading)
                    Spacer()
                    Text("Add a task")
                        .font(.headline)
                        .frame(alignment: .center)
                    Spacer()
                    Button("Add"){
                    }
                    .frame(alignment: .trailing)
                }
                .padding(.top)
                TextField("Task Name", text: $taskName)
                    .textFieldStyle(.plain)
                    .padding(.top)
                    .disableAutocorrection(true)
                    .font(.title2)
                    .cornerRadius(5)
                HStack {
                    DatePicker("Date", selection: $taskDate, in: ...Date(), displayedComponents: .date)
                    Toggle(isOn: $allDay){
                        Text("All-day")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.top)
                HStack {
                    HStack(spacing: 6){
                        Text("Start Time")
                        DatePicker("Start time", selection: $taskStartTime, in: ...Date(), displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                    Spacer()
                    HStack(spacing: 6){
                        Text("End Time")
                        DatePicker("End time", selection: $taskEndTime, in: ...Date(), displayedComponents: .hourAndMinute)
                            .labelsHidden()
                    }
                }
                .padding(.top)
                
                HStack(){
                    Text("Category")
                    Picker("Category", selection: $category){
                        ForEach(Categories, id :\.self){ i in HStack {
                            Image(systemName: "circle.fill")
                            Text(i)
                        }.tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            }
            .presentationDetents([.fraction(0.45)])
            .padding(20)
            .frame(maxHeight: .infinity, alignment: .top)
    }
        }
    }

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
