//
//  Subject.swift
//  MyCreditManager
//
//  Created by Dohyun Kim on 2022/11/23.
//s

import Foundation

struct Subject {
    var name: String
    var grade: String
    
    func convertScore() -> Float {
        switch self.grade {
        case "A+": return 4.5
        case "A": return 4
        case "B+": return 3.5
        case "B": return 3
        case "C+": return 2.5
        case "C": return 2
        case "D+": return 1.5
        case "D": return 1
        default: return 0
        }
    }
}
