//
//  ExamsView.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI


struct ExamsView: View {
    @Binding var exams: [Exam]
    @Binding var progress: [String: CGFloat]
    @State private var showingAddExam = false

    var body: some View {
        NavigationView {
            List {
                ForEach($exams) { $exam in
                    VStack(alignment: .leading) {
                        TextField("Title", text: $exam.title)
                            .font(.headline)
                        Text("Exam Date: \(exam.date)")
                            .font(.subheadline)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let exam = exams[index]
                        progress[exam.title] = nil
                        exams.remove(at: index)
                    }
                }
            }
            .navigationTitle("Exams")
            .toolbar {
                Button(action: { showingAddExam.toggle() }) {
                    Label("Add Exam", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExam) {
            AddExamView(exams: $exams, progress: $progress)
        }
    }
}
