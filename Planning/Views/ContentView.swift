//
//  ContentView.swift
//  Planning
//
//  Created by Sandy Lee on 10/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            
            Text("Hello, world!")
                .padding()
            
            Spacer()
            
            HStack{
                TabIcon(imageName: "calendar", tabTitle: "Tasks")
                CenterTabIcon()
                TabIcon(imageName: "checkmark.bubble", tabTitle: "CheckIn")
            }
            .frame(height: UIScreen.main.bounds.height/10)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CenterTabIcon: View {
    @State private var SheetShow = false
    var body: some View{
        Button {
            print("Sheet expanded")
            SheetShow.toggle()
        } label: {
            ZStack{
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 56, height: 56)
                    .shadow(radius: 4)
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(.systemBlue))
            }
        }
        .offset(y: -40)
        .sheet(isPresented: $SheetShow) {
            TestSheet()
                .presentationDetents([.fraction(0.45)])
                .presentationDragIndicator(.visible)
                .padding(20)
                .frame(maxHeight: .infinity, alignment: .top)
                .transition(.offset(y: -40))
        }
    }
}

struct TabIcon: View {
    let imageName: String
    let tabTitle: String
    var body: some View {
        Spacer()
        Button {
            print("Change view")
        } label: {
            VStack(spacing: 5){
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                Text(tabTitle)
                    .font(.callout)
            }
        }
        Spacer()
    }
}


struct TestSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var taskDate = Date()
    @State private var taskStartTime = Date()
    @State private var taskEndTime = Date()
    @State var taskName: String = ""
    @State private var allDay = false
    let items: [String] = [
    "Task",
    "Selfcare"
    ]
    @State private var selectedItem: String = "Task"
    let taskCategories = ["Purple", "Pink", "Green", "Blue"]
    @State private var category = "Purple"
    let selfCareEmojis = ["🥰", "😴", "🧋"]
    @State private var emoji = ""
    var body : some View {
        VStack{
            HStack{
                Button("Cancel", role: .cancel){
                    dismiss()
                }
                .foregroundColor(.red)
                .frame(alignment: .leading)
                Spacer()
                //                Text("Add a task")
                //                    .font(.headline)
                //                    .frame(alignment: .center)
                //                Spacer()
                Button("Add"){
                }
                .frame(alignment: .trailing)
            }
            .padding(.top)
            Picker("Choose item to add", selection: $selectedItem){
                ForEach(items, id: \.self){ item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top)
            TextField("\(selectedItem) Name", text: $taskName)
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
                if (selectedItem == "Task") {
                Text("Category")
                Picker("Category", selection: $category){
                    ForEach(taskCategories, id :\.self){ i in HStack {
                        Image(systemName: "circle.fill")
                        Text(i)
                    }
                    .tag(i)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                } else {
                    Text("Emoji")
                    Picker("Emoji", selection: $emoji){
                        ForEach(selfCareEmojis, id :\.self){ i in HStack {
                            Text(i)
                        }.tag(i)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                }
        }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        }
    }
}

struct Tab1: View {
    var body: some View{
        Text("Tab1")
    }
}
struct Tab2: View {
    var body: some View{
        Text("Tab2")
    }
}
