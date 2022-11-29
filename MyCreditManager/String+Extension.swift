//
//  String+Extension.swift
//  MyCreditManager
//
//  Created by Dohyun Kim on 2022/11/29.
//

import Foundation

extension String {
    
    func checkGrade() -> Bool {
        if self.isEmpty { return false }
        if self == "F" { return true }
        do {
            var regex: NSRegularExpression
            if self.count == 1 {
                regex = try NSRegularExpression(pattern: "([A-D])",
                                                options: .caseInsensitive)
            } else {
                regex = try NSRegularExpression(pattern: "([A-D])+\\+",
                                                options: .caseInsensitive)
            }
            if let _ = regex.firstMatch(in: self,
                                        options: .reportCompletion,
                                        range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            return false
        }
        return false
    }
}
