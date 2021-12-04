//
//  Day4.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/3/21.
//

import Foundation

fileprivate class Board : CustomStringConvertible {
    var squares = [[Int]]()
    var marked = [Int]()
    var markedRotated = [Int]()
    
    init(squares: [[Int]]) {
        assert(squares.count == 5)
        assert(squares[0].count == 5)
        self.squares = squares
        self.marked = Array(repeating: 0, count: 5)
        self.markedRotated = Array(repeating: 0, count: 5)
    }
    
    convenience init(squares: [String]) {
        var squareInts = [[Int]]()
        for r in squares {
            var rowInts = [Int]()
            for i in r.split(separator: " ") {
                rowInts.append(Int(i)!)
            }
            squareInts.append(rowInts)
        }
        self.init(squares: squareInts)
    }
    
    var description: String {
        var str = ""
        for i in 0..<squares.count {
            var row = ""
            for j in 0..<squares[i].count {
                let marker = (marked[i] & (0x01 << (4-j)) != 0) ? "*" : " "
                row += " \(marker)\(squares[i][j])\(marker) "
            }
            str += "\(row)\n"
        }
        return str
    }
    
    func isWinner() -> Bool {
        for i in marked {
            if i == 0x1f {
                return true
            }
        }
        for i in markedRotated {
            if i == 0x1f {
                return true
            }
        }
        return false
    }
    
    func mark(_ num : Int) {
        for i in 0..<squares.count {
            for j in 0..<squares[i].count {
                if num == squares[i][j] {
                    marked[i] |= 0x01 << (4-j)
                    markedRotated[j] |= 0x01 << (4-i)
                    return
                }
            }
        }
    }
    
    func unmarkedSum() -> Int {
        var sum = 0
        for i in 0..<squares.count {
            for j in 0..<squares[i].count {
                if marked[i] & (0x01 << (4-j)) == 0 {
                    sum += squares[i][j]
                }
            }
        }
        return sum
    }
}

fileprivate let testData = """
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
"""

func testDay4() -> String {
    let (calledNumbers, boards) = parseBoards(boardString: testData)
    let (board, num) = findFirstWinner(calledNumbers: calledNumbers, boards: boards)
    return "\(board.unmarkedSum() * num)"
}

func runDay4() -> String {
    let (calledNumbers, boards) = parseBoards(boardString: Day4Data.boards)
    let (board, num) = findFirstWinner(calledNumbers: calledNumbers, boards: boards)
    return "\(board.unmarkedSum() * num)"
}

func testDay4Part2() -> String {
    let (calledNumbers, boards) = parseBoards(boardString: testData)
    let (board, num) = findLastWinner(calledNumbers: calledNumbers, boards: boards)
    return "\(board.unmarkedSum() * num)"
}

func runDay4Part2() -> String {
    let (calledNumbers, boards) = parseBoards(boardString: Day4Data.boards)
    let (board, num) = findLastWinner(calledNumbers: calledNumbers, boards: boards)
    return "\(board.unmarkedSum() * num)"
}

// Expects the first line to be the numbers to be called, followed by an empty line.
// Boards should be five lines each, separated by an empty line
fileprivate func parseBoards(boardString: String) -> (calledNumbers: [Int], boards: [Board]) {
    let boardStrings = boardString.split(separator: "\n").map { String($0) }
    let calledNumbers = boardStrings[0].split(separator: ",").map { Int($0)! }
    
    var i = 1
    var boards = [Board]()
    while (i + 5) <= boardStrings.count {
        boards.append(Board(squares: Array(boardStrings[i..<i+5])))
        i += 5
    }
    return (calledNumbers, boards)
}

fileprivate func findFirstWinner(calledNumbers: [Int], boards: [Board]) -> (board: Board, winningNumber: Int) {
    for num in calledNumbers {
        for board in boards {
            board.mark(num)
            if board.isWinner() {
                return (board, num)
            }
        }
    }
    preconditionFailure("No winning board")
}

fileprivate func findLastWinner(calledNumbers: [Int], boards: [Board]) -> (board: Board, winningNumber: Int) {
    var numWinners = 0
    for num in calledNumbers {
        for board in boards {
            let wasWinner = board.isWinner()
            board.mark(num)
            if board.isWinner() && !wasWinner {
                numWinners += 1
                if numWinners == boards.count {
                    return (board, num)
                }
            }
        }
    }
    preconditionFailure("No last winning board")
}

func customTestDay4() -> String {
    let board = Board(squares: [
                     "22 13 17 11  0",
                     " 8  2 23  4 24",
                     "21  9 14 16  7",
                     " 6 10  3 18  5",
                     " 1 12 20 15 19",
                     ])
    print("\(board)\n\(board.isWinner())")
    board.mark(22)
    print("\(board)\n\(board.isWinner())")
    board.mark(13)
    board.mark(2)
    board.mark(9)
    board.mark(10)
    board.mark(12)
    print("\(board)\n\(board.isWinner())")
    return "\(board)"
}
