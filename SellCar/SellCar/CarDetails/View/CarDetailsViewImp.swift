//
//  CellDetailsViewImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

final class CarDetailsViewImp: UIView {
    private lazy var layout = makeLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private var dataSource: CarDetailAdapter?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        dataSource = CarDetailAdapter(collectionView)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        configuration.interSectionSpacing = 24.scaleIfNeeded()
    
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(420.scaleIfNeeded()))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(.pi))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16.scaleIfNeeded()
            
            let headerFooterSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(.pi))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]

            section.contentInsets = .init(
                top: 16.scaleIfNeeded(),
                leading: 24.scaleIfNeeded(),
                bottom: .zero,
                trailing: 24.scaleIfNeeded()
            )
            return section
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: configuration)
    }
    
    private func setupUI() {
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.register(
            CarDetailsHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CarDetailsHeader.identifier
        )
        collectionView.register(
            CarDetailsCell.self,
            forCellWithReuseIdentifier: CarDetailsCell.identifier
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60.scale())
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(24.scale())
        }
    }
}

// MARK: - Public -
extension CarDetailsViewImp {
    func update(with postCar: PostsСar, infoUser: CarDetailsModel) {
        dataSource?.update(with: postCar.posts, at: infoUser.user)
    }
}
