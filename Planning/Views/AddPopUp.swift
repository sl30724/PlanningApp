//
//  AddPopUp.swift
//  Planning
//
//  Created by Sandy Lee on 10/26/22.
//

import SwiftUI

enum ItemType: Int, Codable, CaseIterable  {
    case Task
    case Selfcare
    case Category
    
    var itemName: String {
        switch self {
        case .Task: return "Task"
        case .Selfcare: return "Selfcare"
        case .Category: return "Category"
        }
    }
    
    var itemCategory: String {
        switch self {
        case .Task: return "Category"
        case .Selfcare: return "Emojis"
        case .Category: return "Colors"
        }
    }
}

enum Category: Int, Codable, CaseIterable {
    case purple
    case pink
    case green
    case blue
    
    var categoryName: String {
        switch self {
        case .purple: return "purple"
        case .pink: return "pink"
        case .green: return "green"
        case .blue: return "blue"
        }
    }
    
    var categoryColor: Color {
        switch self {
        case .purple: return Color.purple
        case .pink: return Color.pink
        case .green: return Color.green
        case .blue: return Color.blue
        }
    }
}

enum Emoji: Int, Codable, CaseIterable {
    case 🥰
    case 😴
    case 🧋
    
    var emojiName: String {
        switch self {
        case .🥰: return "🥰"
        case .😴: return "😴"
        case .🧋: return "🧋"
        }
    }
    
    var emojiDetails: String {
        switch self {
        case .🥰: return "date"
        case .😴: return "rest"
        case .🧋: return "dessert treat"
        }
    }
}

struct AddPopUp: View {
    @Environment(\.dismiss) var dismiss
    @State var taskDate = Date()
    @State var taskStartTime = Date()
    @State var taskEndTime = Date()
    @State var taskName: String = ""
    @State var allDay = false
    @State var item: ItemType = .Task
    @State var category: Category = .purple
    @State var emoji: Emoji = .🥰
    @State var color = Color.purple
    
    var body : some View {
        VStack{
            HStack{
                Button("Cancel", role: .cancel){
                    dismiss()
                }
                .foregroundColor(.red)
                .frame(alignment: .leading)
                Spacer()
                Button("Add"){
                }
                .frame(alignment: .trailing)
            }
            .padding(.top)
            Picker("Choose item to add", selection: $item){
                ForEach(ItemType.allCases, id: \.self) { item in
                    Text("\(item.itemName)")
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top)
            TextField("\(item.itemName) Name", text: $taskName)
                .textFieldStyle(.plain)
                .padding(.top)
                .disableAutocorrection(true)
                .font(.title2)
                .cornerRadius(5)
            HStack {
                if (item.rawValue < 2) {
                    DatePicker("Date", selection: $taskDate, in: ...Date(), displayedComponents: .date)
                    Toggle(isOn: $allDay){
                        Text("All-day")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .padding(.top)
            HStack {
                if (item.rawValue < 2){
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
            }
            .padding(.top)
            
            HStack(){
                if (item.rawValue == 0) {
                    Text("\(item.itemCategory)")
                    Picker("\(item.itemCategory)", selection: $category){
                        ForEach(Category.allCases, id: \.self) {item in HStack {
                        Image(systemName: "circle.fill")
                            Text("\(item.categoryName)")
                    }
                    .tag(item.categoryName)
                    .foregroundColor(.purple)
                    }
                }
                .pickerStyle(.menu)
                .labelsHidden()
                } else if (item.rawValue == 1) {
                    Text("\(item.itemCategory)")
                    Picker("\(item.itemCategory)", selection: $emoji){
                        ForEach(Emoji.allCases, id :\.self){ item in HStack {
                            Text("\(item.emojiName) \(item.emojiDetails)")
                        }.tag(item.emojiName)
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                } else if (item.rawValue == 2) {
                    Text("\(item.itemCategory)")
//                    Circle()
//                        .foregroundColor(color)
                    ColorPicker("\(item.itemCategory)", selection: $color)
                        .labelsHidden()
                        }
                    }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
        }
    }
}

struct AddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddPopUp()
    }
}
