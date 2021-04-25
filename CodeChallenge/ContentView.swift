import SwiftUI
import Combine
import Advertisement

struct ContentView: View {
    
    @StateObject var model: ContentModel
    @ObservedObject var randomAdd = RandomAdd()
    var body: some View {
        switch model.result {
        case .none:
            Text("Loading")
                .onAppear {
                    randomAdd.setobj()
                    model.fetch()
                }
            
        case .failure:
            Text("Error")
            
        case .success(let response):
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    AdView(
                        title: (randomAdd.tet.title),
                        imageSource: (randomAdd.tet.image),
                        priceAmount: (randomAdd.tet.priceAmount),
                        Advertising: ("Advertising"),
                        showAddLabel: true
                    )
                    ForEach(response.items, id: \.self) { item in
                        AdView(
                            title: item.title,
                            imageSource: item.image,
                            priceAmount: item.priceAmount,
                            Advertising: (""),
                            showAddLabel: false
                        )
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
