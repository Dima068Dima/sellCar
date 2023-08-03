//
//  MainScreenCarsRouter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

final class MainScreenCarsRouter: Router {
    func openEvent(with carId: String) {
        let viewController = makeCarDetailsViewController(with: carId)
        push(viewController)
    }
    
    private func makeCarDetailsViewController(with carId: String) -> CarDetailsViewController {
        let presenter = CarDetailsPresenterImp(carId: carId)
        let viewController = CarDetailsViewController(presenter: presenter)
        presenter.setView(view: viewController)
        return viewController
    }
}
