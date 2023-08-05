//
//  CarDetailsHeader.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 04.08.2023.
//

import Foundation
import SnapKit

final class CarDetailsHeader: UICollectionReusableView {
    private let ownerPicture = UIImageView()
    private let ownerInfo = UIStackView()
    private let ownerNameTitle = UILabel()
    private let ownerNumberCar = UILabel()
    private let carTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    private func setupUI() {
        self.backgroundColor = .systemGray5
        setupOwnerPicture()
        setupOwnerInfoTitle()
        setupOwnerNameTitle()
        setupOwnerEmail()
        setupCarTitle()
    }
    
    private func setupOwnerPicture() {
        ownerPicture.contentMode = .scaleAspectFit
        ownerPicture.layer.borderWidth = 1
        ownerPicture.layer.masksToBounds = true
        ownerPicture.layer.borderColor = UIColor.systemGray5.cgColor
        ownerPicture.layer.cornerRadius = self.frame.height / 3
        ownerPicture.clipsToBounds = true
        addSubview(ownerPicture)
        ownerPicture.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().offset(10.scaleIfNeeded())
            $0.height.equalTo(100.scaleIfNeeded())
            $0.width.equalTo(100.scaleIfNeeded())
        }
    }
    
    private func setupOwnerInfoTitle() {
        ownerInfo.axis = .vertical
        ownerInfo.spacing = 2
        ownerInfo.distribution = .fillEqually
        ownerInfo.alignment = .leading
        
        addSubview(ownerInfo)
        ownerInfo.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.scaleIfNeeded())
            $0.left.equalTo(ownerPicture.snp.right).offset(20.scaleIfNeeded())
            $0.height.equalTo(100.scaleIfNeeded())
        }
    }
    
    private func setupOwnerNameTitle() {
        ownerNameTitle.numberOfLines = 1
        ownerNameTitle.textAlignment = .center
        ownerNameTitle.font = .systemFont(ofSize: 20.scaleIfNeeded())
        
        ownerInfo.addArrangedSubview(ownerNameTitle)
    }
    
    private func setupOwnerEmail() {
        ownerNumberCar.numberOfLines = 1
        ownerNumberCar.textAlignment = .center
        ownerNumberCar.font = .systemFont(ofSize: 20.scaleIfNeeded())
        
        ownerInfo.addArrangedSubview(ownerNumberCar)
    }
    
    private func setupCarTitle() {
        carTitle.numberOfLines = 1
        carTitle.textAlignment = .center
        carTitle.font = .systemFont(ofSize: 16.scaleIfNeeded())
        
        ownerInfo.addArrangedSubview(carTitle)
    }
}

// MARK: - Public -
extension CarDetailsHeader {
    func update(with info: OwnerDetails) {
        guard let urlImage = URL(string: info.avatar.url) else { return }
        ownerPicture.downloaded(from: urlImage)
        ownerNameTitle.text = info.username
        ownerNumberCar.text = "Aвтомобилей - \(info.autoCount)"
        carTitle.text = info.mainAutoName
    }
}
