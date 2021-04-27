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

/// Model for Random Advertising
struct AddModel: Decodable {
    let adId, title: String?
    let image: String?
    let priceAmount: Int?
}

/// Get Random Advertising from Custom framework and decode into local model and make them observable
class RandomAdd: ObservableObject {
    @Published var randomAdd = AddModel(adId: "Add123", title: "No Add", image: "", priceAmount: 000)

    let didChange = PassthroughSubject<Void, Never>()
    var customAdd = CustomAdd()
    func getRandomAdvertisement(){
        customAdd.getRandomAdvertisement(completion: {(result) in
            DispatchQueue.main.async {
                self.randomAdd = try! JSONDecoder().decode(AddModel.self, from: result)
            }
        })
    }
}
