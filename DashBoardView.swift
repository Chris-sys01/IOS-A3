//
//  DashBoardView.swift
//  
//
//  Created by Yangzixuan Liu on 6/5/2026.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: PlannerViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Text("Life Planner")
                        .font(.largeTitle)
                        .bold()

                    Text("Plan your study, fitness and daily goals.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 16) {
                    ProgressView(value: viewModel.completionRate)
                        .progressViewStyle(.linear)

                    Text("\(viewModel.completedCount) of \(viewModel.totalCount) tasks completed")
                        .font(.headline)
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                HStack(spacing: 16) {
                    SummaryCard(
                        title: "Study",
                        count: viewModel.items(for: .study).count,
                        icon: "book.fill"
                    )

                    SummaryCard(
                        title: "Fitness",
                        count: viewModel.items(for: .fitness).count,
                        icon: "figure.run"
                    )

                    SummaryCard(
                        title: "Goals",
                        count: viewModel.items(for: .goal).count,
                        icon: "checkmark.circle.fill"
                    )
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}

struct SummaryCard: View {
    let title: String
    let count: Int
    let icon: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.title2)

            Text(title)
                .font(.headline)

            Text("\(count)")
                .font(.title)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
