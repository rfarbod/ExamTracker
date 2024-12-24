//
//  Exam.swift
//  ExamTracker
//
//  Created by Farbod on 12/24/24.
//

import Foundation

struct Exam: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var date: Date
    var attachments: [String] // File paths or URLs
}
