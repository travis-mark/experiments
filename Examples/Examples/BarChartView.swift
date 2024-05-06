//  Examples/BarChartView.swift

import Charts
import SwiftUI

struct BarChartView: View {
    @State private var selectedCategory: String?
    
    private var count: Int {
        if let selectedCategory = selectedCategory {
            return byCategory.first(where: { $0.category == selectedCategory})!.count
        } else {
            return byCategory.reduce(0, { $0 + $1.count})
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Text(selectedCategory ?? "Categories")
                    .font(.title)
                Text("\(count) Posts")
                    .font(.callout)
            }
            Chart(byCategory, id: \.category) { item in
                BarMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.count))
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", item.category))
                .opacity(item.category == selectedCategory ? 1 : 0.5)
                
            }
            .chartXSelection(value: $selectedCategory)
            .chartLegend(alignment: .center, spacing: 16)
            .scaledToFit()
        }
    }
}

#Preview {
    BarChartView()
}
