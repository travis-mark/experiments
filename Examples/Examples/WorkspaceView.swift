// Examples/WorkspaceView.swift

import SwiftUI

struct WorkspaceView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: {
                    BarChartView()
                }, label: {
                    Text("Bar Chart")
                })
                NavigationLink(destination: {
                    PieChartView(data: byCategory)
                }, label: {
                    Text("Pie Chart")
                })
            }
        }
    }
}

#Preview {
    WorkspaceView()
}
