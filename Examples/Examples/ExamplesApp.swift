//
//  ExamplesApp.swift
//  Examples
//
//  Created by Travis Luckenbaugh on 5/5/24.
//

import SwiftUI

@main
struct ExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            PieChartView(data: byCategory)
        }
    }
}
