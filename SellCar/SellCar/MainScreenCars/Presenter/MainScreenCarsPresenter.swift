//
//  MainScreenCarsPresenter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation

protocol MainScreenCarsPresenter: AnyObject {
    func loadCars()
    func cellDidTap(with eventId: String)
}
