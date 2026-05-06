//
//  plannerItem.swift
//  
//
//  Created by Zhenqiang Chen on 6/5/2026.
//

import Foundation

enum PlannerCategory: String, Codable, CaseIterable, Identifiable {
    case study = "Study"
    case fitness = "Fitness"
    case goal = "Goal"

    var id: String {
        rawValue
    }
}

enum Priority: String, Codable, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"

    var id: String {
        rawValue
    }
}

struct PlannerItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var category: PlannerCategory
    var dueDate: Date
    var priority: Priority
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        title: String,
        category: PlannerCategory,
        dueDate: Date,
        priority: Priority,
        isCompleted: Bool = false
    ) {
        self.id = id
        self.title = title
        self.category = category
        self.dueDate = dueDate
        self.priority = priority
        self.isCompleted = isCompleted
    }
}
