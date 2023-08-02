//
//  MainScreenCarsCell.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import UIKit

final class MainScreenCarsCell: BaseCollectionCell {
    private(set) var carId: String?
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let imageView = UIImageView()
    
    override func setupUI() {
        contentView.layer.cornerRadius = 8
        setupSubtitleLabel()
        setupTitleLabel()
        setupImageView()
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 20.scaleIfNeeded())
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(subtitleLabel.snp.top)
        }
    }
    
    private func setupSubtitleLabel() {
        subtitleLabel.font = .systemFont(ofSize: 12.scaleIfNeeded())
        contentView.addSubview(subtitleLabel)
        
        subtitleLabel.snp.makeConstraints {
            $0.bottom.left.right.equalToSuperview()
            $0.height.equalTo(16.scaleIfNeeded())
        }
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

// MARK: - Public -
extension MainScreenCarsCell {
    func update(with cars: Cars) {
        carId = String(cars.id)
        titleLabel.text = String(cars.year)
        subtitleLabel.text = String(cars.brandName)
    }
}
