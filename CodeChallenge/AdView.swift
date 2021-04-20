import Combine
import SwiftUI

struct AdView: View {

    var title: String
    var imageSource: String
    var priceAmount: Int

    @State private var image: UIImage?
    @State private var task: AnyCancellable?

    var body: some View {
        HStack(alignment: .top) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding(1)
                    )
            } else {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .bold()
                Text("\(priceAmount) EUR")
            }
            Spacer()
        }
        .onAppear {
            if let url = URL(string: imageSource) {
                task?.cancel()
                task = URLSession
                    .shared
                    .dataTaskPublisher(for: url)
                    .map { UIImage(data: $0.data) }
                    .replaceError(with: nil)
                    .receive(on: DispatchQueue.main)
                    .sink { (image) in
                        self.image = image
                    }
            }
        }
        .onDisappear {
            task?.cancel()
        }
    }
}
