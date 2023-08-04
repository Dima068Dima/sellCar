//
//  CarDetailsCell.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

final class CarDetailsCell: BaseCollectionCell {
    private let imageView = UIImageView()
    private let postInfo = UIStackView()
    private let titleLabel = UILabel()
    private let postLabel = UILabel()
    
    override func setupUI() {
        self.backgroundColor = .systemGray6
        setupImageView()
        setupPostInfo()
        setupTitleLabel()
        setupPostLabel()
    }
    
    private func setupImageView() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.scaleIfNeeded())
            $0.left.right.equalToSuperview().inset(10.scaleIfNeeded())
            $0.height.equalTo(250.scaleIfNeeded())
            $0.width.equalTo(300.scaleIfNeeded())
        }
    }
    
    private func setupPostInfo() {
        postInfo.axis = .vertical
        postInfo.spacing = 2
        postInfo.distribution = .fillEqually
        postInfo.alignment = .leading
        
        addSubview(postInfo)
        postInfo.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom)
            $0.left.right.equalToSuperview().inset(10.scaleIfNeeded())
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .justified
        titleLabel.font = .systemFont(ofSize: 16.scaleIfNeeded())
        
        postInfo.addArrangedSubview(titleLabel)
    }
    
    private func setupPostLabel() {
        postLabel.numberOfLines = 3
        postLabel.textAlignment = .justified
        postLabel.font = .systemFont(ofSize: 16.scaleIfNeeded())
        
        postInfo.addArrangedSubview(postLabel)
    }
}

// MARK: - Public -
extension CarDetailsCell {
    func update(with postCar: Post) {
        guard let urlImage = URL(string: postCar.img ?? "") else { return }
        imageView.downloaded(from: urlImage)
        titleLabel.text = postCar.publicationDate.toStringDate(elements: .day, .month, .year)
        postLabel.text = postCar.text
    }
}
