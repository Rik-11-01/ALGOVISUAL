//
//  Contents.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

struct main_app_screen: View {
    @StateObject private var viewModel = SchedulingViewModel()
    @State private var processName: String = ""
    @State private var burstTime: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Add Process").font(.headline)) {
                        TextField("Process Name", text: $processName)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                        
                        TextField("Burst Time", text: $burstTime)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(8)
                        
                        Button(action: {
                            if let burstTimeInt = Int(burstTime) {
                                viewModel.addProcess(name: processName, burstTime: burstTimeInt)
                                processName = ""
                                burstTime = ""
                            }
                        }) {
                            Text("Add Process")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    
                    Section(header: Text("Processes").font(.headline)) {
                        List(viewModel.processes) { process in
                            HStack {
                                Text(process.name)
                                Spacer()
                                Text("\(process.burstTime)")
                            }
                            .padding()
                        }
                    }
                }
                
                HStack {
                    NavigationLink(destination: GanttChartDetailView(title: "FCFS Gantt Chart", schedule: viewModel.fcfsSchedule, totalTime: viewModel.totalTime).onAppear {
                        viewModel.calculateFCFS()
                    }) {
                        Text("Calculate FCFS")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: GanttChartDetailView(title: "SJF Gantt Chart", schedule: viewModel.sjfSchedule, totalTime: viewModel.totalTime).onAppear {
                        viewModel.calculateSJF()
                    }) {
                        Text("Calculate SJF")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
            .navigationTitle("CPU Scheduling")
            .padding()
        }
    }
}





#Preview {
    main_app_screen()
}
