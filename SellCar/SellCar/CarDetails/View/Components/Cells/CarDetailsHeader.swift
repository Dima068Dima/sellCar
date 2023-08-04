//
//  CarDetailsHeader.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 04.08.2023.
//

import Foundation
import SnapKit

final class CarDetailsHeader: UICollectionReusableView {
    private let title = UILabel()
    
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
        setupTitle()
    }
    
    private func setupTitle() {
        addSubview(title)
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
}

// MARK: - Public -
extension CarDetailsHeader {
    func update(with info: OwnerDetails) {
        title.text = info.username
    }
}
