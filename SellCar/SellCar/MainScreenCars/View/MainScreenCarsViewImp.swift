//
//  MainScreenCarsViewImp.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation
import SnapKit

final class MainScreenCarsViewImp: UIView {
    private lazy var layout = makeLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    private var dataSource: MainScreenCarsDataSourceAdapter?
    private let delegateAdapter = MainScreenCarsDelegateAdapter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        dataSource = MainScreenCarsDataSourceAdapter(collectionView)
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
                heightDimension: .absolute(320.scaleIfNeeded()))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(.pi))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 16.scaleIfNeeded()

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
        collectionView.delegate = delegateAdapter
        collectionView.register(MainScreenCarsCell.self,
                                forCellWithReuseIdentifier: MainScreenCarsCell.identifier)
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
extension MainScreenCarsViewImp {
    func update(with cars: [Cars]) {
        dataSource?.update(with: cars)
    }
}
