//
//  PlannerRow.swift
//  
//
//  Created by Zhenqiang Chen on 6/5/2026.
//

import SwiftUI

struct PlannerRow: View {
    @EnvironmentObject var viewModel: PlannerViewModel

    let item: PlannerItem

    var body: some View {
        HStack {
            Button {
                viewModel.toggleCompletion(item)
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isCompleted)

                Text("Priority: \(item.priority.rawValue)")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(item.dueDate, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                viewModel.deleteItem(item)
            } label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
        }
        .padding(.vertical, 4)
    }
}
