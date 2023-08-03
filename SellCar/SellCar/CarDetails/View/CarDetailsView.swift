//
//  CellDetailsView.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

protocol CarDetailsView: AnyObject {
    func update(with postCar: Welcome)
}
