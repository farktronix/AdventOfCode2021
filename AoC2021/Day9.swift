//
//  Day9.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/8/21.
//

import Foundation

fileprivate let testData = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""

struct HeightMap : CustomStringConvertible {
    struct Point {
        let x : Int
        let y : Int
    }
    
    let heights : [[Int]]
    var lowPoints : [Point]
    let width : Int
    
    init(_ str : String) {
        let lines = str.split(separator: "\n")
        width = lines[0].count
        var h = [[Int]]()
        for i in lines {
            var lineInts = [Int](repeating: 0, count: width)
            for (index, char) in i.enumerated() {
                lineInts[index] = char.wholeNumberValue!
            }
            h.append(lineInts)
        }
        
        heights = h
        lowPoints = [Point]()
        lowPoints.append(contentsOf:findLowPoints())
    }
    
    var description: String {
        var retval = ""
        for y in 0..<heights.count {
            var row = ""
            for x in 0..<width {
                if (isLowPoint(x: x, y: y)) {
                    row += "|\(heights[y][x])|"
                } else {
                    row += " \(heights[y][x]) "
                }
            }
            row += "\n"
            retval += row
        }
        return retval
    }
    
    func findLowPoints() -> [Point] {
        var points = [Point]()
        for y in 0..<heights.count {
            for x in 0..<width {
                if isLowPoint(x: x, y: y) {
                    points.append(Point(x: x, y: y))
                }
            }
        }
        return points
    }
    
    func isLowPoint(x : Int, y : Int) -> Bool {
        let v = heights[y][x]
        let height = heights.count
        
        // Check above
        if y > 0 && heights[y-1][x] <= v {
            return false
        }
    
        // Check below
        if y < (height - 1) && heights[y+1][x] <= v {
            return false
        }
        
        // Check left
        if x > 0 && heights[y][x-1] <= v {
            return false
        }
        
        // Check right
        if x < (width - 1) && heights[y][x+1] <= v {
            return false
        }
        
        return true
    }
    
    var riskLevel : Int {
        var riskLevel = 0
        for p in lowPoints {
            riskLevel += heights[p.y][p.x] + 1
        }
        return riskLevel
    }
}

func testDay9() -> String {
    let heightMap = HeightMap(testData)
    return "\(heightMap.riskLevel)"
}

func runDay9() -> String {
    let heightMap = HeightMap(Day9Data.heightMap)
    return "\(heightMap.riskLevel)"
}

func testDay9Part2() -> String {
    return ""
}

func runDay9Part2() -> String {
    return ""
}
