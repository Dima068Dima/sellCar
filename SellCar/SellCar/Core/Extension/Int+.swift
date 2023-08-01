//
//  Int+.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation
import UIKit

extension Int {
    func scale() -> CGFloat {
        let heightMaket = 812.0
        let screenHeight = UIScreen.main.bounds.height
        let scale = CGFloat(heightMaket / screenHeight)
        return CGFloat(self) / scale
    }
    
    func scaleIfNeeded() -> CGFloat {
        return Appearance.orBigger13Mini ? self.scale() : CGFloat(self)
    }
}
