/*
 * Copyright © 2010 - 2024 Modo Labs Inc. All rights reserved.
 *
 * The license governing the contents of this file is located in the LICENSE
 * file located at the root directory of this distribution. If the LICENSE file
 * is missing, please contact sales@modolabs.com.
 *
 */

import XCTest

extension XCTestExpectation {
    var expected: Bool {
        get {
            !self.isInverted
        }
        set {
            self.isInverted = !newValue
        }
    }
}

extension Optional where Wrapped == XCTestExpectation {

    // keystroke saver for unwrapping an expectation and fulfilling it, or failing the test (instead of crashing)
    func fulfillOrFail(
        _ xcTestCase: XCTestCase,
        file: StaticString = #file,
        line: UInt = #line,
        function: StaticString = #function
    ) {
        guard let expectation = self else {
            let msg = "Unexpected call to \(function)"

            let location = XCTSourceCodeLocation(
                filePath: file,
                lineNumber: line
            )
            let sourceCodeContext = XCTSourceCodeContext(location: location)

            let xctIssue = XCTIssue(
                type: .assertionFailure,
                compactDescription: msg,
                detailedDescription: msg,
                sourceCodeContext: sourceCodeContext,
                associatedError: nil,
                attachments: []
            )

            xcTestCase.record(xctIssue)
            return
        }

        expectation.fulfill()
    }
}

