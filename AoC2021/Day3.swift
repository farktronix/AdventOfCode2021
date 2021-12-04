//
//  day3.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/3/21.
//

import Foundation

fileprivate let testData = [0b00100,
                0b11110,
                0b10110,
                0b10111,
                0b10101,
                0b01111,
                0b00111,
                0b11100,
                0b10000,
                0b11001,
                0b00010,
                0b01010]

func testDay3 () -> String {
    return "\(getPower(diags: testData, numBits: 5))"
}

func runDay3 () -> String {
    return "\(getPower(diags: Day3Data.diags, numBits: 12))"
}

func testDay3Part2 () -> String {
    return "\(getO2GeneratorNumber(diags: testData, numBits: 4)*getCO2ScrubberNumber(diags: testData, numBits: 4))"
}

func runDay3Part2  () -> String {
    return "\(getO2GeneratorNumber(diags: Day3Data.diags, numBits: 11)*getCO2ScrubberNumber(diags: Day3Data.diags, numBits: 11))"
}

func getGamma (diags: [Int], numBits: Int) -> Int {
    var oneCounts = [Int](repeating: 0, count: numBits)
    for num in diags {
        for i in 0..<numBits {
            if num & (0x01 << i) != 0 {
                oneCounts[i] += 1
            }
        }
    }
    var gamma = 0x00
    for i in 0..<numBits {
        if oneCounts[i] > (diags.count/2) {
            gamma |= (0x01 << i)
        }
    }
    return gamma
}

func getPower(diags: [Int], numBits: Int) -> Int {
    let gamma = getGamma(diags: diags, numBits: numBits)
    let epsilon = (~gamma & ((0x01<<numBits) - 1))
    return gamma*epsilon
}

func getO2GeneratorNumber(diags: [Int], numBits: Int) -> Int {
    assert(diags.count > 0)
        
    if diags.count == 1 {
        return diags[0]
    }
    
    var oneArray = [Int]()
    var zeroArray = [Int]()
    for num in diags {
        if num & (0x01 << numBits) == 0 {
            zeroArray.append(num)
        } else {
            oneArray.append(num)
        }
    }
    
    if oneArray.count >= zeroArray.count {
        return getO2GeneratorNumber(diags: oneArray, numBits: numBits - 1)
    } else {
        return getO2GeneratorNumber(diags: zeroArray, numBits: numBits - 1)
    }
}

func getCO2ScrubberNumber(diags: [Int], numBits: Int) -> Int {
    assert(diags.count > 0)
    
    //print("bit: \(numBits)\ndiags: \(diags.map({String($0, radix:2)}))")
    
    if diags.count == 1 {
        return diags[0]
    }
    
    var oneArray = [Int]()
    var zeroArray = [Int]()
    for num in diags {
        if num & (0x01 << numBits) == 0 {
            zeroArray.append(num)
        } else {
            oneArray.append(num)
        }
    }
    
    if  zeroArray.count <= oneArray.count {
        return getCO2ScrubberNumber(diags: zeroArray, numBits: numBits - 1)
    } else {
        return getCO2ScrubberNumber(diags: oneArray, numBits: numBits - 1)
    }
}
