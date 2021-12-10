//
//  Day10.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/10/21.
//

import Foundation

fileprivate let testData = """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""

func parseLine(_ str : String) -> (Bool, Character?) {
    var stack = [Character]()
    for c in str {
        switch c {
        case "(","[","{","<":
            stack.append(c)
        case ")":
            let popped = stack[stack.count - 1]
            stack.removeLast()
            if popped != "(" {
                return (false, c)
            }
        case "]":
            let popped = stack[stack.count - 1]
            stack.removeLast()
            if popped != "[" {
                return (false, c)
            }
        case "}":
            let popped = stack[stack.count - 1]
            stack.removeLast()
            if popped != "{" {
                return (false, c)
            }
        case ">":
            let popped = stack[stack.count - 1]
            stack.removeLast()
            if popped != "<" {
                return (false, c)
            }
        default:
            continue
        }
    }
    
    return (true, nil)
}

func scoreLines (_ str : String) -> Int {
    var score = 0
    for line in str.components(separatedBy: "\n") {
        let (retVal, char) = parseLine(line)
        if retVal == false {
            switch char! {
            case ")":
                score += 3
            case "]":
                score += 57
            case "}":
                score += 1197
            case ">":
                score += 25137
            default:
                break
            }
        }
    }
    return score
}

func testDay10() -> String {
    return "\(scoreLines(testData))"
}

func runDay10() -> String {
    return "\(scoreLines(Day10Data.navigationLines))"
}

func testDay10Part2() -> String {
    return ""
}

func runDay10Part2() -> String {
    return ""
}
