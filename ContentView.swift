//
//  ContentView.swift
//  
//
//  Created by Yangzixuan Liu on 6/5/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            StudyView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Study")
                }

            FitnessView()
                .tabItem {
                    Image(systemName: "figure.run")
                    Text("Fitness")
                }

            GoalsView()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Goals")
                }

            ReminderView()
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Reminder")
                }
        }
    }
}
