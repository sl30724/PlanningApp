//
//  ContentView.swift
//  Planning
//
//  Created by Sandy Lee on 9/19/22.
//

import SwiftUI

struct TaskCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Circle()
                .stroke()
                .frame(width: 20)
            VStack(alignment: .leading, spacing: 8) {
                if let TaskData = TaskDetails.TaskData {
                    Text("\(TaskData.taskName)")
                    Text("\(TaskData.time)")
                        .foregroundColor(Color.secondary)
                } else {
                    Text("No taskName found")
                }
            }
            Image(systemName: "ellipsis")
        }
        .padding()
        .shadow(radius: 20)
        .background(Color.cyan)
        .cornerRadius(10)
    }
}

struct TaskCard_Previews: PreviewProvider {
    static var previews: some View {
        TaskCard()
    }
}
