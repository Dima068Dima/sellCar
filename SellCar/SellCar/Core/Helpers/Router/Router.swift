//
//  Router.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

class Router {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func needShowNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    func makeNavigationController() -> UINavigationController? {
        navigationController
    }
}

extension Router: Routable {
    func present(_ controller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        navigationController?.present(controller, animated: animated, completion: completion)
    }
    
    func push(_ viewController: UIViewController) {
        push(viewController, animated: true)
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: true, completion: completion)
    }
}
