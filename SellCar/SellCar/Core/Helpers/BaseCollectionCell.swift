//
//  BaseCollectionCell.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import UIKit

class BaseCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }

    func setupUI() {
         // Override
    }
}
