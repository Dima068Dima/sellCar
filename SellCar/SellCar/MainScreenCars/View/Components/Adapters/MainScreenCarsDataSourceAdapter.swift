//
//  MainScreenCarsDataSourceAdapter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import UIKit

final class MainScreenCarsDataSourceAdapter: NSObject {
    private typealias MainScreenCarsDataSource = UICollectionViewDiffableDataSource<Section, Cars>
    
    private let collectionView: UICollectionView
    private var dataSource: MainScreenCarsDataSource?
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        dataSource = createDataSource()
    }
    
    func update(with newsPost: [Cars]) {
        guard var snapshot = dataSource?.snapshot() else { return }
        snapshot.deleteAllItems()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(newsPost, toSection: Section.main)
        dataSource?.apply(snapshot, animatingDifferences: false)
    }

    private func createDataSource() -> MainScreenCarsDataSource {
        let dataSource = MainScreenCarsDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, car in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MainScreenCarsCell.identifier,
                    for: indexPath) as? MainScreenCarsCell else {
                    assertionFailure()
                    return UICollectionViewCell()
                }
                cell.update(with: car)
                cell.layer.cornerRadius = 8
                return cell
            })
        return dataSource
    }
}

extension MainScreenCarsDataSourceAdapter {
    enum Section {
        case main
    }
}
