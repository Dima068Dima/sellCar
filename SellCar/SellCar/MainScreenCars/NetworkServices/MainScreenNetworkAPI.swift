//
//  MainScreenNetworkAPI.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import Alamofire

final class MainScreenNetworkAPI {
    private let header = HTTPHeader(
        name: "Authorization",
        value: "Bearer 787071117870711178707111307b63465677870787071111c6df96e084d083a36e52fc5")
    
    func getCars() async throws -> CarsScreen {
        let url = "http://am111.05.testing.place/api/v1/cars/list"
        
        return try await AF.request(
            url,
            method: .get,
            headers: [header]
        )
        .validate(statusCode: [200])
        .serializingDecodable(CarsScreen.self)
        .value
    }
}
