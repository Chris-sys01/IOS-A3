//
//  FittnessView.swift
//  
//
//  Created by Zicheng Mei on 6/5/2026.
//

import SwiftUI

struct FitnessView: View {
    @EnvironmentObject var viewModel: PlannerViewModel

    @State private var title = ""
    @State private var dueDate = Date()
    @State private var priority: Priority = .medium

    var body: some View {
        NavigationStack {
            Form {
                Section("Add Workout") {
                    TextField("Workout title", text: $title)

                    DatePicker("Workout Date", selection: $dueDate, displayedComponents: .date)

                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }

                    Button("Add Workout") {
                        viewModel.addItem(
                            title: title,
                            category: .fitness,
                            dueDate: dueDate,
                            priority: priority
                        )

                        title = ""
                        priority = .medium
                    }
                }

                Section("Fitness Plan") {
                    ForEach(viewModel.items(for: .fitness)) { item in
                        PlannerRow(item: item)
                    }
                }
            }
            .navigationTitle("Fitness Planner")
        }
    }
}
