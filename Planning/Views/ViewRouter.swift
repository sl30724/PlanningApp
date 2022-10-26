//
//  ViewRouter.swift
//  Planning
//
//  Created by Sandy Lee on 10/26/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentView: TabBarViewModel = .Tasks
    
    var view: some View { return currentView.view }
}

enum TabBarViewModel: Int, CaseIterable {
    case Tasks
    case CheckIn
    
    var imageName: String {
        switch self {
        case .Tasks: return "calendar"
        case .CheckIn: return "checkmark.bubble"
        }
    }
    
    var tabTitle: String {
        switch self {
        case .Tasks: return "Tasks"
        case .CheckIn: return "Check-In"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .Tasks: TaskView()
        case .CheckIn: CheckInView()
        }
    }
}
