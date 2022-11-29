//
//  Student.swift
//  MyCreditManager
//
//  Created by Dohyun Kim on 2022/11/23.
//

import Foundation

class Student {
    ///이름
    var name: String
    var subjectArr: [Subject]
    
    init(name: String) {
        self.name = name
        self.subjectArr = []
    }
    
    func updateSubject(subject: Subject) {
        
        if subjectArr.contains(where: { $0.name == subject.name }) {
            if let index = subjectArr.firstIndex(where: { $0.name == subject.name }) {
                subjectArr[index].grade = subject.grade
            }
        } else {
            subjectArr.append(subject)
        }
    }
    
    func deleteSubject(subject: String) {
        if subjectArr.contains(where: { $0.name == subject }) {
            if let index = subjectArr.firstIndex(where: { $0.name == subject }) {
                subjectArr.remove(at: index)
            }
        } else {
            print("\(self.name)학생의 \(subject)과목이 없습니다.")
        }
    }
    
    func getAverageScore() {
        subjectArr.forEach {
            print("\($0.name): \($0.grade)")
        }
        
        var gradeSum: Float = 0
        
        for subject in subjectArr {
            gradeSum += subject.convertScore()
        }
        
        let averageScore = gradeSum / Float(subjectArr.count)
        
        print("평점 : \(averageScore)")
    }
}
