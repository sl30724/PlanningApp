//
//  TaskDetails.swift
//  Planning
//
//  Created by Sandy Lee on 10/2/22.
//

import Foundation

struct TaskDetails: Codable {
    var taskName: String
    var time: String
    
    static var TaskData: TaskDetails? {
        TaskDetails.fromJSON(named: "TaskData")
    }
    
    static func fromJSON(named name: String) -> TaskDetails? {
        if let data = Data.fromJSONFile(forName: name) {
            let decoder = JSONDecoder()
            do {
                let TaskData = try decoder.decode(TaskDetails.self, from: data)
                return TaskData
            } catch {
                print("Could not make TaskData from data.", error.localizedDescription)
            }
        }
        return nil
    }
}
