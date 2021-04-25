import SwiftUI
import Combine
import Advertisement

class ContentModel: ObservableObject {
    @Published private(set) var result: Result<AdsResponse, AdsResponseError>?

    func fetch() {

        let url = URL(string: "https://gateway.ebay-kleinanzeigen.de/mobile-api/candidate/ads")
        let request = URLRequest(gatewayURL: url!)

        URLSession.shared.dataTask(with: request) { [weak self] (data, _, _) in

            guard
                let data = data,
                let object = try? JSONDecoder().decode(AdsResponse.self, from: data)
            else
            {
                DispatchQueue.main.async {
                    self?.result = .failure(AdsResponseError.failed)
                }
                return
            }
            DispatchQueue.main.async {
                self?.result = .success(object)
            }
        }
        .resume()
    }
}
