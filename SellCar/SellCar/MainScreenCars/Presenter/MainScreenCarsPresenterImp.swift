//
//  MainScreenCarsPresenterImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation


final class MainScreenCarsPresenterImp {
    
}

// MARK: - View Model -

struct CarsScreen {
    let cars: [Cars]
}

struct Cars {
    let uuid = UUID()
    
    let id: Int
    let forSale: Int
    let brandName: String
    let modelName: String
    let engineName: String
    let year: Int
    let price: Int?
    let image: String
  
    enum CodingKeys: String, CodingKey {
           case id
           case forSale = "for_sale"
           case brandName = "brand_name"
           case modelName = "model_name"
           case engineName = "engine_name"
           case year, price
           case image
       }
}

extension Cars: Hashable {
    static func == (lhs: Cars, rhs: Cars) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
