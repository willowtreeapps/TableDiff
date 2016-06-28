//
//  InsertTests.swift
//  DeepDiff
//
//  Created by Ian Terrell on 6/27/16.
//  Copyright © 2016 WillowTree. All rights reserved.
//

import XCTest
import DeepDiff

class InsertTests: XCTestCase {

    func testInsertHead() {
        let x: [Int] = [1, 2, 3]
        let y: [Int] = [0, 1, 2, 3]
        let (diff, updates) = x.deepDiff(y)
        XCTAssertEqual([DiffStep.insert(atIndex: 0, item: 0)], diff)
        XCTAssertEqual([], updates)
    }

    func testInsertTail() {
        let x: [Int] = [1, 2, 3]
        let y: [Int] = [1, 2, 3, 0]
        let (diff, updates) = x.deepDiff(y)
        XCTAssertEqual([DiffStep.insert(atIndex: 3, item: 0)], diff)
        XCTAssertEqual([], updates)
    }

    func testInsertMiddle() {
        let x: [Int] = [1, 2, 3]
        let y: [Int] = [1, 2, 0, 3]
        let (diff, updates) = x.deepDiff(y)
        XCTAssertEqual([DiffStep.insert(atIndex: 2, item: 0)], diff)
        XCTAssertEqual([], updates)
    }

    func testInsertMultiple() {
        let x: [Int] = [1, 2, 3]
        let y: [Int] = [4, 1, 2, 5, 3, 6]
        let (diff, updates) = x.deepDiff(y)
        let expectedDiff: [DiffStep<Int,Int>] = [
            DiffStep.insert(atIndex: 0, item: 4),
            DiffStep.insert(atIndex: 3, item: 5),
            DiffStep.insert(atIndex: 5, item: 6),
        ]
        XCTAssertEqual(expectedDiff, diff)
        XCTAssertEqual([], updates)
    }

}