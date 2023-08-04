//
//  CarDetailAdapter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

import UIKit

final class CarDetailAdapter: NSObject {
    private typealias CarDetailDataSource = UICollectionViewDiffableDataSource<Section<New, OwnerDetails>, Post>
    
    private var snapshot: NSDiffableDataSourceSnapshot<Section<New, OwnerDetails>, Post>?
    private let collectionView: UICollectionView
    private var dataSource: CarDetailDataSource?
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        dataSource = createDataSource()
        setupHeader()
    }
    
    func update(with newsPost: [Post], at user: OwnerDetails) {
        let section = [Section(headerItem: New.main, items: user)]
        self.snapshot = NSDiffableDataSourceSnapshot<Section<New, OwnerDetails>, Post>()
        snapshot?.deleteAllItems()
        snapshot?.appendSections(section)
        snapshot?.appendItems(newsPost, toSection: section.first!)
        dataSource?.apply(snapshot!, animatingDifferences: true)
    }
    
    private func createDataSource() -> CarDetailDataSource {
        let dataSource = CarDetailDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, data in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CarDetailsCell.identifier,
                    for: indexPath
                ) as? CarDetailsCell else {
                    assertionFailure()
                    return UICollectionViewCell()
                }
                cell.update(with: data)
                cell.layer.cornerRadius = 8
                return cell
            }
        )
        return dataSource
    }
    
    private func setupHeader() {
        guard let dataSource else { return }
        dataSource.supplementaryViewProvider = {(
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            let header: CarDetailsHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: CarDetailsHeader.identifier,
                for: indexPath
            ) as! CarDetailsHeader
            
            guard let section = self.snapshot?.sectionIdentifiers[indexPath.section] else {
                assertionFailure()
                return UICollectionReusableView()
            }
            
            header.update(with:section.items)
            header.layer.cornerRadius = 8
            return header
        }
    }
}

extension CarDetailAdapter {
    enum New: Hashable {
        case main
    }
    
    struct Section<U: Hashable, T: Hashable>: Hashable {
        let headerItem: U
        let items: T
    }
}
