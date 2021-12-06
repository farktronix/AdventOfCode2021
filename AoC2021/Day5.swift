//
//  Day5.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/4/21.
//

import Foundation

struct VentPoint {
    let x : Int
    let y : Int
    
    init(_ str: String) {
        let points = str.split(separator: ",")
        assert(points.count == 2)
        x = Int(points[0])!
        y = Int(points[1])!
    }
}

struct VentLine {
    var start : VentPoint
    var end : VentPoint
    
    init(_ str : String) {
        let points = str.split(separator: " ")
        assert(points.count == 3)
        start = VentPoint(String(points[0]))
        end = VentPoint(String(points[2]))
    }
}

struct VentMap : CustomStringConvertible {
    let lines : [VentLine]
    var map : [[Int]]
    
    init(_ str : String) {
        var maxX = 0
        var maxY = 0
        
        var lines = [VentLine]()
        for s in str.split(separator: "\n") {
            let line = VentLine(String(s))
            lines.append(line)
            if line.start.x > maxX {
                maxX = line.start.x
            } else if line.end.x > maxX {
                maxX = line.end.x
            }
            
            if line.start.y > maxY {
                maxY = line.start.y
            } else if line.end.y > maxY {
                maxY = line.end.y
            }
        }
        self.lines = lines
        
        self.map = Array(repeating: Array(repeating: 0, count: maxY+1), count: maxX+1)
    }
    
    mutating func calcHorizontalLines() {
        for line in self.lines {
            if line.start.x == line.end.x {
                let x = line.start.x
                let startY = min(line.start.y, line.end.y)
                let endY = max(line.start.y, line.end.y)
                for y in startY...endY {
                    map[y][x] += 1
                }
                
            } else if line.start.y == line.end.y {
                let y = line.start.y
                let startX = min(line.start.x, line.end.x)
                let endX = max(line.start.x, line.end.x)
                for x in startX...endX {
                    map[y][x] += 1
                }
            }
        }
    }
    
    mutating func calcDiagonalLines() {
        for line in self.lines {
            if line.start.x != line.end.x &&
               line.start.y != line.end.y {
                
                var yDir = 1
                var xDir = 1
                
                if line.start.y > line.end.y {
                    yDir = -1
                }
                if line.start.x > line.end.x {
                    xDir = -1
                }
                
                var y = line.start.y
                var x = line.start.x
                while y != line.end.y {
                    map[y][x] += 1
                    y += yDir
                    x += xDir
                }
                map[line.end.y][x] += 1
            }
        }
    }
    
    var overlapCount: Int {
        var count = 0
        for y in map {
            for x in y {
                if x > 1 {
                    count += 1
                }
            }
        }
        return count
    }
    
    var description: String {
        var retval = ""
        for y in map {
            for x in y {
                retval += (x == 0 ? "." : String(x))
            }
            retval += "\n"
        }
        return retval
    }
}

fileprivate let testData = """
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""

func testDay5() -> String {
    var map = VentMap(testData)
    map.calcHorizontalLines()
    return "\(map.overlapCount)"
}

func runDay5() -> String {
    var map = VentMap(Day5Data.lines)
    map.calcHorizontalLines()
    return "\(map.overlapCount)"
}

func testDay5Part2() -> String {
    var map = VentMap(testData)
    map.calcHorizontalLines()
    map.calcDiagonalLines()
    return "\(map.overlapCount)"
}

func runDay5Part2() -> String {
    var map = VentMap(Day5Data.lines)
    map.calcHorizontalLines()
    map.calcDiagonalLines()
    return "\(map.overlapCount)"
}
