//
//  RandomAdd.swift
//  CodeChallenge
//
//  Created by Tarun on 22/04/2021.
//

import SwiftUI
import Foundation
import Advertisement
import Combine

struct RandomAddModel: Identifiable {
    let id = UUID()
    var adId: String
    var title: String
    var image: String
    var priceAmount: Int
}
struct AddModel: Decodable {
    let adID, title: String?
    let image: String?
    let priceAmount: Int?
}

class RandomAdd: ObservableObject {

    let didChange = PassthroughSubject<Void, Never>()
    var customAdd = CustomAdd()
    var tet = RandomAddModel(adId: "Add123", title: "AddTitle", image: "", priceAmount: 123) { didSet {}}
    
    func setobj(){
        customAdd.getRandomAdvertisement(completion: {(result) in
            print(result)
            let model = try! JSONDecoder().decode(AddModel.self, from: result)
//            self.tet = RandomAddModel(adId: "212", title: "232323", image: "", priceAmount: 5)
            self.tet = RandomAddModel(adId: model.adID ?? "", title: model.title ?? "", image: model.image ?? "", priceAmount: model.priceAmount ?? 0)

        })
    }
}

