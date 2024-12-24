//
//  AddExamView.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI

struct AddExamView: View {
    @Binding var exams: [Exam]
    @Binding var progress: [String: CGFloat]
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Exam Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Exam Date", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("Add Exam")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newExam = Exam(title: title, description: description, date: date, attachments: [])
                        exams.append(newExam)
                        progress[title] = 0
                        dismiss()
                    }
                }
            }
        }
    }
}
