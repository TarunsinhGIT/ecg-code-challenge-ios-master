//
//  RandomAdd.swift
//  CodeChallenge
//
//  Created by Tarun on 22/04/2021.
//

//import SwiftUI
//import Foundation
//import Advertisement
//
//
//struct RandomAdd: Identifiable {
//    let id = UUID()
//    var adId: String
//    var title: String
//    var image: String
//    var priceAmount: Int
//}
//
//extension RandomAdd{
//    static func all() -> RandomAdd{
//
//        let customAdd = CustomAdd()
//
//        var tet = RandomAdd(adId: "2", title: "2", image: "", priceAmount: 2)
//        customAdd.getRandomAdvertisement(completion: {(result) in
//            print(result)
////            self.add = Ad(adId: "111", title: "223", image: "", priceAmount: 2)
////            self.add = .success(Ad(adId: "11", title: "1212", image: "", priceAmount: 22))
//            tet = RandomAdd(adId: "212", title: "232323", image: "", priceAmount: 5)
//        })
//
//        return tet
////        return RandomAdd(adId: "12", title: "222", image: "", priceAmount: 0)
//    }
//
//    func getAdd(){
//        let customAdd = CustomAdd()
//        customAdd.getRandomAdvertisement(completion: {(result) in
//            print(result)
//        })
//    }
//}






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

class RandomAdd: BindableObject {

    let didChange = PassthroughSubject<void,never>()
    
    let customAdd = CustomAdd()
    var tet = RandomAdd(adId: "2", title: "2", image: "", priceAmount: 2){
        didSet {
            customAdd.getRandomAdvertisement(completion: {(result) in
                print(result)
    //            self.add = Ad(adId: "111", title: "223", image: "", priceAmount: 2)
    //            self.add = .success(Ad(adId: "11", title: "1212", image: "", priceAmount: 22))
                self.tet = RandomAdd(adId: "212", title: "232323", image: "", priceAmount: 5)
            })
        }
    }
    
}
//extension RandomAdd{
//    static func all() -> RandomAdd{
//
//        let customAdd = CustomAdd()
//
//        var tet = RandomAdd(adId: "2", title: "2", image: "", priceAmount: 2)
//        customAdd.getRandomAdvertisement(completion: {(result) in
//            print(result)
////            self.add = Ad(adId: "111", title: "223", image: "", priceAmount: 2)
////            self.add = .success(Ad(adId: "11", title: "1212", image: "", priceAmount: 22))
//            tet = RandomAdd(adId: "212", title: "232323", image: "", priceAmount: 5)
//        })
//
//        return tet
////        return RandomAdd(adId: "12", title: "222", image: "", priceAmount: 0)
//    }
//
//    func getAdd(){
//        let customAdd = CustomAdd()
//        customAdd.getRandomAdvertisement(completion: {(result) in
//            print(result)
//        })
//    }
//}
