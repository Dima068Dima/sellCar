//
//  CarDetailAdapter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

import UIKit

final class CarDetailAdapter: NSObject {
    private typealias CarDetailDataSource = UICollectionViewDiffableDataSource<Section, Post>
    
    private let collectionView: UICollectionView
    private var dataSource: CarDetailDataSource?
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        dataSource = createDataSource()
    }
    
    func update(with newsPost: [Post]) {
        guard var snapshot = dataSource?.snapshot() else { return }
        snapshot.deleteAllItems()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(newsPost, toSection: Section.main)
        dataSource?.apply(snapshot, animatingDifferences: true)
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
}

extension CarDetailAdapter {
    enum Section {
        case main
    }
}
