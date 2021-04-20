import SwiftUI
import Combine

struct ContentView: View {

    @StateObject var model: ContentModel

    var body: some View {
        switch model.result {
        case .none:
            Text("Loading")
                .onAppear {
                    model.fetch()
                }

        case .failure:
            Text("Error")

        case .success(let response):
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(response.items, id: \.self) { item in
                        AdView(
                            title: item.title,
                            imageSource: item.image,
                            priceAmount: item.priceAmount
                        )
                    }
                }
            }
            .padding()
        }
    }
}
