//
//  CellDetailsViewController.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation

import UIKit

final class CarDetailsViewController: UIViewController {
    private let mainView = CarDetailsViewImp()
    private let presenter: CarDetailsPresenter
    
    init(presenter: CarDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
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
        presenter.loadDetailCar()
    }
}

extension CarDetailsViewController: CarDetailsView {
    func update(with postCar: Welcome) {
        mainView.update(with: postCar)
    }
}
