//
//  CarDetailsNetworkAPI.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import Alamofire

final class CarDetailsNetworkAPI {
    private let header = HTTPHeader(
        name: "Load Car Details",
        value: "Bearer 787071117870711178707111307b63465677870787071111c6df96e084d083a36e52fc5")
    
    func getReward(with carId: String) async throws -> CarDetailsModel {
        let url = "http://am111.05.testing.place/api/v1/car/\(carId)"
        
        return try await AF.request(
            url,
            method: .get,
            headers: [header]
        )
        .validate(statusCode: [200])
        .serializingDecodable(CarDetailsModel.self)
        .value
    }
}
