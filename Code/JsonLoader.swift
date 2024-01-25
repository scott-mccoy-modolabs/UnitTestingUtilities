/*
* Copyright © 2010 - 2024 Modo Labs Inc. All rights reserved.
*
* The license governing the contents of this file is located in the LICENSE
* file located at the root directory of this distribution. If the LICENSE file
* is missing, please contact sales@modolabs.com.
*
*/

import XCTest

// Loads & Decodes JSON from Unit Test Bundle.
enum JsonLoaderError: Error {
    case fileNotFound
    case couldNotGetData(Error)
    case codableHelperError(LocalCodableHelperError)
}

class JsonLoader {
    static var bundle: Bundle {
        return Bundle(for: type(of: JsonLoader()))
    }

    static func load<T: Decodable>(
        type: T.Type,
        filename: String,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .iso8601
    ) -> Result<T, JsonLoaderError> {

        // Get path
        guard let url = bundle.url(forResource: filename, withExtension: nil) else {
            return .failure(.fileNotFound)
        }

        // Get data
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            return .failure(.couldNotGetData(error))
        }

        // Decode
        return LocalCodableHelper().decode(
            type: type,
            from: data,
            keyDecodingStrategy: keyDecodingStrategy,
            dateDecodingStrategy: dateDecodingStrategy
        ).mapError {
            .codableHelperError($0)
        }
    }

    static func loadData(filename: String) -> Data? {
        guard let path = bundle.url(forResource: filename, withExtension: nil) else {
            return nil
        }
        do {
            return try Data(contentsOf: path)
        } catch {
            return nil
        }
    }
}
