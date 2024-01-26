/*
 * Copyright © 2010 - 2024 Modo Labs Inc. All rights reserved.
 *
 * The license governing the contents of this file is located in the LICENSE
 * file located at the root directory of this distribution. If the LICENSE file
 * is missing, please contact sales@modolabs.com.
 *
 */

import XCTest

public struct CountedXCTestExpectation {
    public let expectation: XCTestExpectation
    public private(set) var currentFulfillmentCount: Int = 0

    public mutating func fulfill() {
        currentFulfillmentCount += 1
        expectation.fulfill()
    }
}
