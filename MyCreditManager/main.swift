//
//  main.swift
//  MyCreditManager
//
//  Created by Dohyun Kim on 2022/11/23.
//

import Foundation

///학생 배열
var studentArr: [Student] = []

///처음 질문
func firstAsk() {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    
    let input = readLine()
    
    switch input {
    case "1":
        addStudent()
    case "2":
        deleteStudent()
    case "3":
        updateScore()
    case "4":
        deleteScore()
    case "5":
        showAverageScore()
    case "X":
        exit()
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        if input != nil {
            firstAsk()
        }
    }
    
}

///1.학생 추가
func addStudent() {
    print("추가할 학생의 이름을 입력해주세요")
    
    if let input = readLine(),
       input.trimmingCharacters(in: .whitespaces).count > 0 {
        
        if studentArr.contains(where: { $0.name == input }) {
            print("\(input)은/는 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            studentArr.append(.init(name: input))
            print("\(input) 학생을 추가했습니다.")
        }
    } else {
        print(failMsg) // 입력이 잘못되었습니다. 다시 확인해주세요.
    }
    
    firstAsk()
}

func deleteStudent() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    let input = readLine() ?? ""
    
    if studentArr.contains(where: { $0.name == input }) {
        if let index = studentArr.firstIndex(where: { $0.name == input}) {
            studentArr.remove(at: index)
            print("\(input) 학생을 삭제했습니다.")
        }
    } else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
    firstAsk()
}

func updateScore() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력 예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    let input = readLine() ?? ""
    let info = input.components(separatedBy: " ")

    let student = info[0]
    
    if info.count == 3 && info[2].checkGrade() {
        if studentArr.contains(where: { $0.name == student }) {
            if let index = studentArr.firstIndex(where: { $0.name == student}) {
                
                var grade = info[2]
                let start: Character = grade[grade.startIndex]
                let end: Character = grade[grade.index(before: grade.endIndex)]
                print(start)
                print(end)
                
                if start.isLowercase {
                    print(start.uppercased())
                    grade = "\(start.uppercased())\(end == "+" ? "+" : "")"
                }
                
                let subject = Subject(name: info[1], grade: grade)
                studentArr[index].updateSubject(subject: subject)
                print("\(student) 학생의 \(subject.name) 과목이 \(subject.grade)로 추가(변경)되었습니다.")
            }
        } else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    
    firstAsk()
}

func deleteScore() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력 예) Mickey Swift")
    
    let input = readLine() ?? ""
    let info = input.components(separatedBy: " ")
    
    let student = info[0]
    if info.count == 2 {
        if studentArr.contains(where: { $0.name == student }) {
            if let index = studentArr.firstIndex(where: { $0.name == student}) {
                let subject = info[1]
                studentArr[index].deleteSubject(subject: subject)
                print("\(student) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
            }
        } else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
    
    firstAsk()
}

func showAverageScore() {
    print("평점을 알고 싶은 학생의 이름을 입력해주세요.")
    let input = readLine() ?? ""
    
    if studentArr.contains(where: { $0.name == input }) {
        if let index = studentArr.firstIndex(where: { $0.name == input}) {
            studentArr[index].getAverageScore()
        }
    } else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
    firstAsk()
}

///종료
func exit() {
    print("프로그램을 종료합니다...")
}

firstAsk()
