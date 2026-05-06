//
//  PlannerViewModel.swift
//  
//
//  Created by Zhenqiang Chen on 6/5/2026.
//

import Foundation

class PlannerViewModel: ObservableObject {
    @Published var items: [PlannerItem] = [] {
        didSet {
            saveItems()
        }
    }

    private let saveKey = "lifePlannerItems"

    init() {
        loadItems()

        if items.isEmpty {
            addSampleData()
        }
    }

    func addItem(
        title: String,
        category: PlannerCategory,
        dueDate: Date,
        priority: Priority
    ) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedTitle.isEmpty else {
            return
        }

        let newItem = PlannerItem(
            title: trimmedTitle,
            category: category,
            dueDate: dueDate,
            priority: priority
        )

        items.append(newItem)
    }

    func deleteItem(_ item: PlannerItem) {
        items.removeAll { $0.id == item.id }
    }

    func toggleCompletion(_ item: PlannerItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else {
            return
        }

        items[index].isCompleted.toggle()
    }

    func items(for category: PlannerCategory) -> [PlannerItem] {
        items.filter { $0.category == category }
    }

    var completedCount: Int {
        items.filter { $0.isCompleted }.count
    }

    var totalCount: Int {
        items.count
    }

    var completionRate: Double {
        guard totalCount > 0 else {
            return 0
        }

        return Double(completedCount) / Double(totalCount)
    }

    private func saveItems() {
        do {
            let data = try JSONEncoder().encode(items)
            UserDefaults.standard.set(data, forKey: saveKey)
        } catch {
            print("Failed to save items: \(error.localizedDescription)")
        }
    }

    private func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: saveKey) else {
            return
        }

        do {
            items = try JSONDecoder().decode([PlannerItem].self, from: data)
        } catch {
            print("Failed to load items: \(error.localizedDescription)")
        }
    }

    private func addSampleData() {
        items = [
            PlannerItem(
                title: "Finish SwiftUI assignment",
                category: .study,
                dueDate: Date(),
                priority: .high
            ),
            PlannerItem(
                title: "Review lecture notes",
                category: .study,
                dueDate: Date(),
                priority: .medium
            ),
            PlannerItem(
                title: "30 minutes cardio",
                category: .fitness,
                dueDate: Date(),
                priority: .medium
            ),
            PlannerItem(
                title: "Drink enough water",
                category: .goal,
                dueDate: Date(),
                priority: .low
            )
        ]
    }
}
