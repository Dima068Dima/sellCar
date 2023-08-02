//
//  MainScreenCarsPresenterImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation

final class MainScreenCarsPresenterImp: MainScreenCarsPresenter {
    private weak var view: MainScreenCarsView?
    private let mainScreenNetworkAPI = MainScreenNetworkAPI()
    
    func loadCars() {
        Task {
            do {
               let carsResponse = try await mainScreenNetworkAPI.getCars()
                await MainActor.run {
                    view?.update(with: carsResponse)
                }
            } catch {
                
            }
        }
    }
    
    func setView(view: MainScreenCarsView) {
        self.view = view
    }
    
    func cellDidTap(with eventId: String) {
        //
    }
}

// MARK: - View Model -

struct CarsScreen: Decodable {
    let cars: [Cars]
}

struct Cars: Decodable {
    let uuid = UUID()
    
    let id: Int
    let forSale: Int
    let brandName: String
    let modelName: String
    let engineName: String
    let name: String
    let year: Int
    let price: Int?
    let image: String
  
    enum CodingKeys: String, CodingKey {
           case id
           case forSale = "for_sale"
           case brandName = "brand_name"
           case modelName = "model_name"
           case engineName = "engine_name"
           case year, price, name, image
       }
}

extension Cars: Hashable {
    static func == (lhs: Cars, rhs: Cars) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
