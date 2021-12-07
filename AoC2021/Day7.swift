//
//  Day7.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/6/21.
//

import Foundation

fileprivate let testData = "16,1,2,0,4,2,7,1,2,14"

func parsePositions(_ str : String) -> [Int] {
    return str.components(separatedBy: ",").map{Int($0)!}
}

func getMedianValue(_ values : [Int]) -> Int {
    let v = values.sorted()
    let half = v.count / 2
    if v.count % 2 == 0 {
        return (v[half - 1] + v[half]) / 2
    } else {
        return v[half]
    }
}

func getMeanValue(_ values : [Int]) -> Int {
    let sum = values.reduce(0, { x, y in x + y })
    return Int(ceil(Float(sum) / Float(values.count)))
}

func fuelNeededForPosition(positions: [Int], target: Int) -> Int {
    var fuel = 0
    for i in positions {
        fuel += abs(target - i)
    }
    return fuel
}

func increasingFuelNeededForPosition(positions: [Int], target: Int) -> Int {
    var fuel = 0
    for i in positions {
        let distance = abs(target - i)
        fuel += (distance * (distance + 1)) / 2
    }
    return fuel
}

func testDay7() -> String {
    let positions = parsePositions(testData)
    let target = getMedianValue(positions)
    let fuel = fuelNeededForPosition(positions: positions, target: target)
    return "\(fuel)"
}

func runDay7() -> String {
    let positions = parsePositions(Day7Data.crabPositions)
    let target = getMeanValue(positions)
    let fuel = fuelNeededForPosition(positions: positions, target: target)
    return "\(fuel)"
}

func testDay7Part2() -> String {
    let positions = parsePositions(testData)
    let target = getMeanValue(positions)
    let fuel = increasingFuelNeededForPosition(positions: positions, target: target)
    return "\(fuel)"
}

func runDay7Part2() -> String {
    let positions = parsePositions(Day7Data.crabPositions)
    let target = getMeanValue(positions)
    var bestFuel = NSIntegerMax
    // Yuck
    for x in (target-10)...(target+10) {
        let fuel = increasingFuelNeededForPosition(positions: positions, target: x)
        if fuel < bestFuel {
            bestFuel = fuel
        }
    }
    return "\(bestFuel)"
}
