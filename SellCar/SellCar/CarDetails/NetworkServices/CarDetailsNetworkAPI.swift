//
//  CarDetailsNetworkAPI.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import Alamofire

final class CarDetailsNetworkAPI {
    func getReward(with carId: String) async throws -> CarDetailsModel {
        let url = "http://am111.05.testing.place/api/v1/car/\(carId)"
        
        return try await AF.request(
            url,
            method: .get,
            headers: [:]
        )
        .validate(statusCode: [200])
        .serializingDecodable(CarDetailsModel.self)
        .value
    }
    
    func getPostCar(with carId: String) async throws -> Welcome {
        let url = "http://am111.05.testing.place/api/v1/car/\(carId)/posts"
        
        return try await AF.request(
            url,
            method: .get,
            headers: [:]
        )
        .validate(statusCode: [200])
        .serializingDecodable(Welcome.self)
        .value
    }
}
