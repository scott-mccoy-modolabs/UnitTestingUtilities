/*
 * Copyright © 2010 - 2024 Modo Labs Inc. All rights reserved.
 *
 * The license governing the contents of this file is located in the LICENSE
 * file located at the root directory of this distribution. If the LICENSE file
 * is missing, please contact sales@modolabs.com.
 *
 */

import XCTest

extension XCTestCase {
    var testBundle: Bundle {
        Bundle(for: type(of: self))
    }

    var testImageUrl: URL {
        testBundle.url(forResource: "tv_test_pattern.jpeg", withExtension: nil)!
    }

    var testImageData: Data {
        // swiftlint:disable:next force_try
        try! Data(contentsOf: testImageUrl)
    }

    func countedExpectation(description: String) -> CountedXCTestExpectation {
        let expectation = expectation(description: description)
        return CountedXCTestExpectation(expectation: expectation)
    }
}
