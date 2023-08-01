//
//  UICollectionReusableView+.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import UIKit

// MARK: - Identifier -
extension UICollectionReusableView {
    static var identifier: String {
        return NSStringFromClass(self)
    }
}
