//
//  Untitled.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI

struct ProgressIndicatorView: View {
    @Binding var progress: [String: CGFloat]
    var exams: [Exam] // No need for @Binding if it's just data to display

    var body: some View {
        VStack {
            Text("Exam Progress")
                .font(.headline)
            ScrollView {
                ForEach(exams) { exam in
                    VStack(alignment: .leading) {
                        Text(exam.title)
                        ProgressView(value: progress[exam.title] ?? 0, total: 1.0)
                            .accentColor(.blue)
                    }
                }
            }
        }
    }
}
