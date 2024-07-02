//
//  SchedulingVIewMOdel.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

class SchedulingViewModel: ObservableObject {
    @Published var processes: [Process] = []
    @Published var fcfsSchedule: [(Process, Int)] = []
    @Published var sjfSchedule: [(Process, Int)] = []
    @Published var totalTime: Int = 0
    
    func addProcess(name: String, burstTime: Int) {
        let newProcess = Process(id: processes.count + 1, name: name, burstTime: burstTime)
        processes.append(newProcess)
    }
    
    func calculateFCFS() {
        var time = 0
        fcfsSchedule = []
        for process in processes {
            fcfsSchedule.append((process, time))
            time += process.burstTime
        }
        totalTime = time
    }
    
    func calculateSJF() {
        var time = 0
        sjfSchedule = []
        let sortedProcesses = processes.sorted(by: { $0.burstTime < $1.burstTime })
        for process in sortedProcesses {
            sjfSchedule.append((process, time))
            time += process.burstTime
        }
        totalTime = time
    }
}

#Preview {
    SchedulingViewModel() as! any View
}
