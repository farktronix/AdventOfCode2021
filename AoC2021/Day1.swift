//
//  Day1.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/3/21.
//

import Foundation

fileprivate let testData = [199,
                200,
                208,
                210,
                200,
                207,
                240,
                269,
                260,
                263]

func testDay1 () -> String {
    return "\(countIncreases(depth: testData))"
}

func runDay1 () -> String {
    return "\(countIncreases(depth: Day1Data.depths))"
}

func countIncreases(depth: [Int]) -> Int {
    var increases = 0
    var lastDepth = depth[0]
    for i in depth {
        if i > lastDepth {
            increases += 1
        }
        lastDepth = i
    }
    return increases
}

func testDay1Part2 () -> String {
    return "\(countIncreaseSlidingWindow(depth: testData))"
}

func runDay1Part2 () -> String {
    return "\(countIncreaseSlidingWindow(depth: Day1Data.depths))"
}

func countIncreaseSlidingWindow(depth: [Int]) -> Int {
    var windows = [Int]()
    windows.append(depth[0] + depth[1] + depth[2])
    for i in 1..<(depth.count - 1) {
        windows.append(depth[i-1] + depth[i] + depth[i + 1])
    }
    return countIncreases(depth: windows)
}
