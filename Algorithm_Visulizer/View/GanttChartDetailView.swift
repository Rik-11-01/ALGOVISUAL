//
//  GanttChartDetailView.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

struct GanttChartDetailView: View {
    let title: String
    let schedule: [(Process, Int)]
    let totalTime: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            GanttChartView(schedule: schedule)
            
            Text("Total Time: \(totalTime)")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    GanttChartDetailView(title: "ritik ", schedule: Mockdata, totalTime: 20)
}
