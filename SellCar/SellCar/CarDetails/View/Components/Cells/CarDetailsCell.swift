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
        self.backgroundColor = .systemGray6
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
        titleLabel.textAlignment = .justified
        titleLabel.font = .systemFont(ofSize: 16.scaleIfNeeded())
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).inset(50.scaleIfNeeded())
            $0.left.right.equalToSuperview().offset(10.scaleIfNeeded())
            $0.height.equalTo(29.scaleIfNeeded())
        }
    }
}

// MARK: - Public -
extension CarDetailsCell {
    func update(with postCar: Post) {
        titleLabel.text = postCar.publicationDate.toStringDate(elements: .day, .month, .year)
        guard let urlImage = URL(string: postCar.img) else { return }
        imageView.downloaded(from: urlImage)
    }
}
