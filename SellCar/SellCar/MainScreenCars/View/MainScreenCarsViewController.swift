//
//  MainScreenCarsViewController.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 01.08.2023.
//

import Foundation
import UIKit

final class MainScreenCarsViewController: UIViewController {
    private let mainView = MainScreenCarsViewImp()
    private let presenter: MainScreenCarsPresenter
    
    init(presenter: MainScreenCarsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        setupActions()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
        presenter.loadCars()
    }
    
    private func setupActions() {
        mainView.setCellAction { [unowned self] eventId in
            let router = MainScreenCarsRouter(navigationController: navigationController)
            router.openEvent(with: eventId)
        }
    }
}

extension MainScreenCarsViewController: MainScreenCarsView {
    func update(with cars: [Cars]) {
        mainView.update(with: cars)
    }
}
