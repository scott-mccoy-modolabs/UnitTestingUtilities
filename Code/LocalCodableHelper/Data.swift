/*
 * Copyright © 2010 - 2024 Modo Labs Inc. All rights reserved.
 *
 * The license governing the contents of this file is located in the LICENSE
 * file located at the root directory of this distribution. If the LICENSE file
 * is missing, please contact sales@modolabs.com.
 *
 */

extension Data {
    public var prettyPrintedJSONString: String {
        guard
            let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers),
            let jsonData = try? JSONSerialization.data(
                withJSONObject: json,
                options: [.prettyPrinted, .withoutEscapingSlashes]
            ),
            let strPretty = String(data: jsonData, encoding: .utf8) else {
            return "Malformed JSON"
        }

        return strPretty
    }
}
