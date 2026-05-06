//
//  studyView.swift
//  
//
//  Created by Zhenqiang Chen on 6/5/2026.
//

import SwiftUI

struct StudyView: View {
    @EnvironmentObject var viewModel: PlannerViewModel

    @State private var title = ""
    @State private var dueDate = Date()
    @State private var priority: Priority = .medium

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Add Study Task") {
                        TextField("Task title", text: $title)

                        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)

                        Picker("Priority", selection: $priority) {
                            ForEach(Priority.allCases) { priority in
                                Text(priority.rawValue).tag(priority)
                            }
                        }

                        Button("Add Task") {
                            viewModel.addItem(
                                title: title,
                                category: .study,
                                dueDate: dueDate,
                                priority: priority
                            )

                            title = ""
                            priority = .medium
                        }
                    }

                    Section("Study Tasks") {
                        ForEach(viewModel.items(for: .study)) { item in
                            PlannerRow(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Study Planner")
        }
    }
}
