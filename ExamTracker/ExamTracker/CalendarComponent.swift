//
//  CalendarComponent.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import SwiftUI

struct CalendarComponent: View {
    @Binding var selectedDate: Date?
    
    var body: some View {
        DatePicker(
            "Select Date",
            selection: Binding(get: { selectedDate ?? Date() },
                               set: { selectedDate = $0 }),
            displayedComponents: [.date]
        )
        .datePickerStyle(GraphicalDatePickerStyle())
    }
}
