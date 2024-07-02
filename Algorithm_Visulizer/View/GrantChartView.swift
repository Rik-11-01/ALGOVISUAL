//
//  GrantChartView.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

struct GrantChartView: View {
        let schedule: [(Process, Int)]
        let title: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                HStack {
                    ForEach(schedule, id: \.0.id) { (process, startTime) in
                        VStack {
                            Text(process.name)
                            Text("\(startTime)-\(startTime + process.burstTime)")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }
                }
            }
            .padding()
        }
    }


#Preview {
    GrantChartView(schedule: SchedulingViewModel().fcfsSchedule, title: "ritik")
}
