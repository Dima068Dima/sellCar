//
//  CarDetailsPresenterImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

final class CarDetailsPresenterImp: CarDetailsPresenter {
    
}

// MARK: - View Model -

struct CarDetailsModel: Decodable {
    let cars: Car
    let ownerDetails: OwnerDetails
}

struct Car: Decodable {
    let uuid = UUID()
    
    let id: Int
    let name: String
    let uin: String
  
    enum CodingKeys: String, CodingKey {
           case id
           case name
           case uin = "place_id"
       }
}

struct OwnerDetails: Decodable {
        let id: Int
        let username, email, about: String
        let avatar: Avatar
        let autoCount: Int
        let mainAutoName: String

        enum CodingKeys: String, CodingKey {
            case id, username, email, about, avatar
            case autoCount = "auto_count"
            case mainAutoName = "main_auto_name"
        }
}

struct Avatar: Decodable {
    let url: String
}

//extension Car: Hashable {
//    static func == (lhs: Cars, rhs: Cars) -> Bool {
//        lhs.uuid == rhs.uuid
//    }
//}
