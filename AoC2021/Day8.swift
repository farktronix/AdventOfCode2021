//
//  Day8.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/7/21.
//

import Foundation

fileprivate let testData = """
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
"""

struct SevenSegmentSignals {
    var numbersBySignal : [String : Int]
    
    var signals : [String]
    var output : [String]
    
    var matchingOutputCount : Int
    
    init(_ str : String) {
        numbersBySignal = [String:Int]()
        
        let splitLine = str.split(separator: "|")
        signals = splitLine[0].trimmingCharacters(in: .whitespaces).split(separator: " ").map{String($0.sorted())}
        output = splitLine[1].trimmingCharacters(in: .whitespaces).split(separator: " ").map{String($0.sorted())}
        
        for s in signals {
            switch s.count {
                case 2:
                    numbersBySignal[s] = 1
                case 3:
                    numbersBySignal[s] = 7
                case 4:
                    numbersBySignal[s] = 4
                case 7:
                    numbersBySignal[s] = 8
                default:
                    break
            }
        }
        
        matchingOutputCount = 0
        for s in output {
            switch s.count {
                case 2:
                    matchingOutputCount += 1
                case 3:
                    matchingOutputCount += 1
                case 4:
                    matchingOutputCount += 1
                case 7:
                    matchingOutputCount += 1
                default:
                    break
            }
        }
    }
}

func testDay8() -> String {
    var knownNumbers = 0
    for line in testData.split(separator: "\n") {
        let segment = SevenSegmentSignals(String(line))
        knownNumbers += segment.matchingOutputCount
    }
    return "\(knownNumbers)"
}

func runDay8() -> String {
    var knownNumbers = 0
    for line in Day8Data.segments.split(separator: "\n") {
        let segment = SevenSegmentSignals(String(line))
        knownNumbers += segment.matchingOutputCount
    }
    return "\(knownNumbers)"
}

func testDay8Part2() -> String {
    return ""
}

func runDay8Part2() -> String {
    return ""
}
