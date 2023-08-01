//
//  MainScreenCarsDelegateAdapter.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 02.08.2023.
//

import Foundation
import UIKit

final class MainScreenCarsDelegateAdapter: NSObject, UICollectionViewDelegate {
    private var action: ((String) -> Void?)?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MainScreenCarsCell else { return }

        guard let eventId = cell.carId else {
            assertionFailure()
            return
        }

        action?(eventId)
    }
}

// MARK: - Public -
extension MainScreenCarsDelegateAdapter {
    func setAction(_ action: @escaping (String) -> Void?) {
        self.action = action
    }
}
