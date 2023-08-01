//
//  MainScreenCarsViewImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation
import SnapKit

final class MainScreenCarsViewImp: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
}

// MARK: - Public -
extension MainScreenCarsViewImp {
    func update(with cars: CarsScreen) {
        //
    }
}
