import SwiftUI
import Combine
import Advertisement

struct ContentView: View {
    
    @StateObject var model: ContentModel
    @ObservedObject var randomAdd = RandomAdd()//Observable object for Random Advertising
    var body: some View {
        switch model.result {
        case .none:
            Text("Loading")
                .onAppear {
                    model.fetch()
                    randomAdd.setobj()//Calling Random Advertising framework
                }
            
        case .failure:
            Text("Error")
            
        case .success(let response):
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    AdView(
                        title: (randomAdd.randomAdd.title ?? ""),
                        imageSource: (randomAdd.randomAdd.image ?? ""),
                        priceAmount: (randomAdd.randomAdd.priceAmount ?? 0),
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
