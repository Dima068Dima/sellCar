//
//  Routable.swift
//  SellCar
//
//  Created by Дмитрий Татаринцев on 03.08.2023.
//

import Foundation
import UIKit

protocol Routable: AnyObject {
    func present(_ controller: UIViewController, animated: Bool, completion: (() -> Void)?)
    func push(_ viewController: UIViewController)
    func push(_ viewController: UIViewController, animated: Bool)
}
