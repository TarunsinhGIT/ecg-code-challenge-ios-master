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
    let didChange = PassthroughSubject<Void, Never>()
    var customAdd = CustomAdd()
    var randomAdd = AddModel(adId: "NoAdd123", title: "No Add", image: "", priceAmount: 000) { didSet {}}
    func setobj(){
        customAdd.getRandomAdvertisement(completion: {(result) in
            self.randomAdd = try! JSONDecoder().decode(AddModel.self, from: result)
        })
    }
}

