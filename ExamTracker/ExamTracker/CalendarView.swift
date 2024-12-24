//
//  CalendarView.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI

struct CalendarView: View {
    @Binding var exams: [Exam]
    @Binding var progress: [String: CGFloat]
    @Binding var selectedDate: Date?
    
    var body: some View {
        VStack {
            Text("Drag tiles onto the calendar to allocate study sessions.")
                .padding()
            CalendarComponent(selectedDate: $selectedDate)
                .padding()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(exams) { exam in
                        DraggableTile(title: exam.title, progress: $progress)
                    }
                }
                .padding()
            }
        }
    }
}

struct DraggableTile: View {
    let title: String
    @Binding var progress: [String: CGFloat]
    
    var body: some View {
        Text(title)
            .padding()
            .background(Color.blue)
            .cornerRadius(8)
            .foregroundColor(.white)
            .onDrag {
                // Update progress on drag
                progress[title] = min((progress[title] ?? 0) + 0.1, 1.0)
                return NSItemProvider(object: title as NSString)
            }
    }
}
