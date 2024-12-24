//
//  ContentView.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var exams: [Exam] = []
    @State private var progress: [String: CGFloat] = [:]
    @State private var selectedDate: Date? = nil
    
    var body: some View {
        TabView {
            // Exams Section
            ExamsView(exams: $exams, progress: $progress)
                .tabItem {
                    Label("Exams", systemImage: "list.bullet")
                }
            
            // Calendar Section
            CalendarView(exams: $exams, progress: $progress, selectedDate: $selectedDate)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            // Progress Tracker Section
            ProgressIndicatorView(progress: $progress, exams: exams)
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
