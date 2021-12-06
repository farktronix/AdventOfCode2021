//
//  Day6.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/5/21.
//

import Foundation

fileprivate let testData = "3,4,3,1,2"

struct Lanternfish : CustomStringConvertible {
    var timer : Int
    
    init() {
        timer = 8
    }
    
    init(_ str : String) {
        timer = Int(str)!
    }
    
    var description: String { return String(timer) }
    
    mutating func tick() -> Lanternfish? {
        var newFish : Lanternfish?
        if timer == 0 {
            newFish = Lanternfish()
            timer = 6
        } else {
            timer -= 1
        }
        return newFish
    }
}

struct School : CustomStringConvertible {
    var fish : [Lanternfish]
    
    var numFish : Int { return fish.count }
    
    init(_ str : String) {
        fish = [Lanternfish]()
        for age in str.components(separatedBy: ",") {
            fish.append(Lanternfish(age))
        }
    }
    
    var description: String {
        return fish.map{$0.description}.joined(separator: ",")
    }
    
    mutating func tick() {
        for i in 0..<fish.count {
            if let newFish = fish[i].tick() {
                fish.append(newFish)
            }
        }
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
    return ""
}
