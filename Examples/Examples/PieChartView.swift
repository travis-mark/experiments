// Examples/PieChartView.swift
// Source: https://useyourloaf.com/blog/swiftui-pie-charts/

import Charts
import SwiftUI

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

struct PieChartView: View {
    @State private var selectedAngle: Double?
    let data: [PostCount]
    
    private let categoryRanges: [(category: String, range: Range<Double>)]
    private let totalPosts: Int
    
    init(data: [PostCount]) {
        self.data = data
        var total = 0
        categoryRanges = data.map {
            let newTotal = total + $0.count
            let result = (category: $0.category,
                          range: Double(total) ..< Double(newTotal))
            total = newTotal
            return result
        }
        self.totalPosts = total
    }
    
    var selectedItem: PostCount? {
        guard let selectedAngle else { return nil }
        if let selected = categoryRanges.firstIndex(where: {
            $0.range.contains(selectedAngle)
        }) {
            return data[selected]
        }
        return nil
    }
    
    var body: some View {
        VStack {
            Chart(data, id: \.category) { item in
                SectorMark(
                    angle: .value("Count", item.count),
                    innerRadius: .ratio(0.618),
                    angularInset: 2
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Category", item.category))
                .opacity(item.category == selectedItem?.category ? 1 : 0.5)
            }
            .chartAngleSelection(value: $selectedAngle)
            .chartBackground { chartProxy in
                GeometryReader { geometry in
                    if let anchor = chartProxy.plotFrame {
                        let frame = geometry[anchor]
                        VStack {
                            Text(selectedItem?.category ?? "Categories")
                                .font(.title)
                            Text((selectedItem?.count.formatted() ?? totalPosts.formatted()) + " posts")
                                .font(.callout)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
            .chartLegend(alignment: .center, spacing: 16)
            .scaledToFit()
        }
    }
}

#Preview {
    PieChartView(data: byCategory)
}
