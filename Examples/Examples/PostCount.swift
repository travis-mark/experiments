//  Examples/PostCount.swift
//  Sample data for charts

import Foundation

struct PostCount {
    var id: Int
    var category: String
    var count: Int
}

let byCategory: [PostCount] = [
    .init(id: 1, category: "Xcode", count: 79),
    .init(id: 2, category: "Swift", count: 73),
    .init(id: 3, category: "SwiftUI", count: 58),
    .init(id: 4, category: "WWDC", count: 15),
    .init(id: 5, category: "SwiftData", count: 9)
]
