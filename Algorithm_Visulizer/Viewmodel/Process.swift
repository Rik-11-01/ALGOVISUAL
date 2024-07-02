//
//  Process.swift
//  Algorithm_Visulizer
//
//  Created by Ritik Raman on 02/07/24.
//

import SwiftUI

struct Process: Identifiable {
    let id: Int
    let name: String
    let burstTime: Int
}

let Mockdata = [
    (Process(id: 1, name: "A", burstTime: 4), 0),
    (Process(id: 2, name: "B", burstTime: 2), 4),
    (Process(id: 3, name: "C", burstTime: 1), 6)
]
