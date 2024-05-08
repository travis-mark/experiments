//  Examples/LineChartView.swift

import SwiftUI
import Charts

struct LineChartView: View {
    @State private var selectedCategory: String?
    
    private var count: Int {
        if let selectedCategory = selectedCategory {
            return byCategory.first(where: { $0.category == selectedCategory})!.count
        } else {
            return byCategory.reduce(0, { $0 + $1.count})
        }
    }
    
    // TODO: Add crossover highlight
    var body: some View {
        VStack {
            VStack {
                Text(selectedCategory ?? "Categories")
                    .font(.title)
                Text("\(count) Posts")
                    .font(.callout)
            }
            Chart(byCategory, id: \.category) { item in
                LineMark(
                    x: .value("Category", item.category),
                    y: .value("Value", item.count))
                .symbol(Circle())
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
    LineChartView()
}
