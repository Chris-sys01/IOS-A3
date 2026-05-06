//
//  GoalsView.swift
//  
//
//  Created by Zicheng Mei on 6/5/2026.
//

import SwiftUI

struct GoalsView: View {
    @EnvironmentObject var viewModel: PlannerViewModel

    @State private var title = ""
    @State private var dueDate = Date()
    @State private var priority: Priority = .low

    var body: some View {
        NavigationStack {
            Form {
                Section("Add Daily Goal") {
                    TextField("Goal title", text: $title)

                    DatePicker("Date", selection: $dueDate, displayedComponents: .date)

                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }

                    Button("Add Goal") {
                        viewModel.addItem(
                            title: title,
                            category: .goal,
                            dueDate: dueDate,
                            priority: priority
                        )

                        title = ""
                        priority = .low
                    }
                }

                Section("Daily Goals") {
                    ForEach(viewModel.items(for: .goal)) { item in
                        PlannerRow(item: item)
                    }
                }
            }
            .navigationTitle("Daily Goals")
        }
    }
}
