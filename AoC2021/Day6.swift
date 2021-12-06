//
//  Day6.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/5/21.
//

import Foundation

fileprivate let testData = "3,4,3,1,2"

struct School {
    var fish : [Int]
    
    var numFish : Int {
        var n = 0
        for f in fish {
            n += f
        }
        return n
    }
    
    init(_ str : String) {
        fish = [Int](repeating: 0, count: 9)
        for ageStr in str.components(separatedBy: ",") {
            let age = Int(ageStr)!
            fish[age] += 1
        }
    }
    
    mutating func tick() {
        let spawningFish = fish[0]
        for i in 1...8 {
            fish[i-1] = fish[i]
        }
        fish[8] = spawningFish
        fish[6] += spawningFish
    }
}

func testDay6() -> String {
    var school = School(testData)
    for _ in 1...80 {
        school.tick()
    }
    return "\(school.numFish)"
}

func runDay6() -> String {
    var school = School(Day6Data.lanternfish)
    for _ in 1...80 {
        school.tick()
    }
    return "\(school.numFish)"
}

func testDay6Part2() -> String {
    var school = School(testData)
    for _ in 1...256 {
        school.tick()
    }
    return "\(school.numFish)"
}

func runDay6Part2() -> String {
    var school = School(Day6Data.lanternfish)
    for _ in 1...256 {
        school.tick()
    }
    return "\(school.numFish)"
}
