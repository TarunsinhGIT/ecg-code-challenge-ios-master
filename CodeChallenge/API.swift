import Foundation

struct Throwable<T: Decodable>: Decodable {
    let result: Result<T, Error>

    init(from decoder: Decoder) throws {
        let catching = { try T(from: decoder) }
        result = Result(catching: catching)
    }
}

struct Ad: Decodable {
    var adId: String
    var title: String
    var image: String
    var priceAmount: Int
}

extension Ad: Hashable {}

struct AdsResponse: Decodable {
    var items: [Ad]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let throwables = try container.decode([Throwable<Ad>].self, forKey: .items)
        items = throwables.compactMap { try? $0.result.get() }
    }
}

enum AdsResponseError: Error {
    case failed
}

extension URLRequest {

    init(gatewayURL: URL) {
        self.init(url: gatewayURL)
        httpMethod = "GET"
        addValue("*/*", forHTTPHeaderField: "accept")
        addValue("application/json", forHTTPHeaderField: "content-type")
        addValue("1.16", forHTTPHeaderField: "x-ecg-ver")
        addValue("en;q=1", forHTTPHeaderField: "accept-language")
        addValue("br, gzip, deflate", forHTTPHeaderField: "accept-encoding")

        let userPasswordString = "candidate:yx6Xz62y"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        if let base64EncodedCredential = base64EncodedCredential {
            addValue("Basic \(base64EncodedCredential)", forHTTPHeaderField: "authorization")
        }
    }
}
