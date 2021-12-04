//
//  Day2.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/3/21.
//

import Foundation

fileprivate let testData = ["forward 5",
                            "down 5",
                            "forward 8",
                            "up 3",
                            "down 8",
                            "forward 2"]

fileprivate enum Direction {
    case forward
    case up
    case down
}

fileprivate struct Instruction {
    var direction : Direction
    var distance : Int
}

func testDay2 () -> String {
    let (h, d) = getPosition(instructionStrings: testData)
    return "\(h*d)"
}

func runDay2 () -> String {
    let (h, d) = getPosition(instructionStrings: Day2Data.instructions)
    return "\(h*d)"
}

func testDay2Part2 () -> String {
    let (h, d) = getPositionWithAim(instructionStrings: testData)
    return "\(h*d)"
}

func runDay2Part2 () -> String {
    let (h, d) = getPositionWithAim(instructionStrings: Day2Data.instructions)
    return "\(h*d)"
}

func getPosition(instructionStrings: [String]) -> (horizontal: Int, depth: Int) {
    var horizontal = 0
    var depth = 0
    for str in instructionStrings {
        let i = parseInstructionString(str: str)
        switch i.direction {
        case .forward:
            horizontal += i.distance
        case .up:
            depth -= i.distance
        case .down:
            depth += i.distance
        }
    }
    return (horizontal, depth)
}

func getPositionWithAim(instructionStrings: [String]) -> (horizontal: Int, depth: Int) {
    var horizontal = 0
    var depth = 0
    var aim = 0
    for str in instructionStrings {
        let i = parseInstructionString(str: str)
        switch i.direction {
        case .forward:
            horizontal += i.distance
            depth += aim * i.distance
        case .up:
            aim -= i.distance
        case .down:
            aim += i.distance
        }
    }
    return (horizontal, depth)
}


fileprivate func parseInstructionString(str : String) -> Instruction {
    let components = str.split(separator: " ")
    var direction : Direction
    switch components[0] {
    case "forward":
        direction = .forward
    case "up":
        direction = .up
    case "down":
        direction = .down
    default:
        preconditionFailure("Unexpected direction: \(components[0])")
    }
    return Instruction(direction: direction, distance: Int(components[1])!)
}
