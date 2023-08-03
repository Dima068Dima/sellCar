//
//  CarDetailsCell.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

final class CarDetailsCell: BaseCollectionCell {
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    override func setupUI() {
        self.backgroundColor = .lightGray
        setupImageView()
        setupTitleLabel()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 18.scaleIfNeeded())
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5.scaleIfNeeded())
            $0.left.equalToSuperview().offset(8.scaleIfNeeded())
            $0.height.equalTo(29.scaleIfNeeded())
        }
    }
}

// MARK: - Public -
extension CarDetailsCell {
    func update(with postCar: Post) {
        titleLabel.text = postCar.text
        guard let urlImage = URL(string: postCar.img) else { return }
        imageView.downloaded(from: urlImage)
    }
}
