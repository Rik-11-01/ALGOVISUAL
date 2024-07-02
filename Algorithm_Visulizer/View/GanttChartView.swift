//
//  GanttChartView.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

struct GanttChartView: View {
    let schedule: [(Process, Int)]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                ForEach(schedule, id: \.0.id) { (process, startTime) in
                    VStack {
                        Text(process.name)
                            .font(.caption)
                            .padding(4)
                        Text("\(startTime)-\(startTime + process.burstTime)")
                            .font(.caption2)
                            .padding(4)
                    }
                    .frame(minWidth: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(2)
                    .transition(.scale)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemGray5))
        .cornerRadius(8)
    }
}

#Preview {
    GanttChartView(schedule: Mockdata)
}
