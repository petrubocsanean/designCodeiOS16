//
//  ChartView.swift
//  DesignCodeiOS16
//
//  Created by Petru Bocsanean on 03/03/2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        Chart {
            ForEach(data) { item in
                LineMark(x: .value("Day", item.day), y: .value("Value", item.value))
                    .cornerRadius(10)
            }
        }
        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .frame(height: 300)
        .padding(20)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data = [
    Value(day: "Jun 1", value: 200),
    Value(day: "Jun 2", value: 96),
    Value(day: "Jun 3", value: 310),
    Value(day: "Jun 4", value: 250),
    Value(day: "Jun 5", value: 110),
]
