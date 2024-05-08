// Examples/WorkspaceView.swift

import SwiftUI

struct WorkspaceView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: {
                    BarChartView()
                }, label: {
                    HStack {
                        Image(systemName: "chart.bar.xaxis.ascending")
                        Text("Bar Chart")
                    }
                })
                NavigationLink(destination: {
                    LineChartView()
                }, label: {
                    HStack {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Line Chart")
                    }
                    
                })
                // TODO: Area
                // TODO: Point
                // TODO: Rectangle
                // TODO: Rule
                NavigationLink(destination: {
                    PieChartView(data: byCategory)
                }, label: {
                    HStack {
                        Image(systemName: "chart.pie.fill")
                        Text("Pie Chart")
                    }
                })
            }
        }
    }
}

#Preview {
    WorkspaceView()
}
