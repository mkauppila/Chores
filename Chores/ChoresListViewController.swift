//
//  ViewController.swift
//  Chores
//
//  Created by Markus Kauppila on 26/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListNavigator {
    var rootNavigator: RootNavigator?
    var presenter: ChoresListPresenter?

    func presentFrom(window: UIWindow) {
        let viewController = ChoresListViewController()
        viewController.presenter = presenter
        presenter?.viewController = viewController
        rootNavigator?.showRoot(viewController: viewController, inWindow: window)
    }
}

class ChoresListInteractor {
    weak var output: ChoresListPresenter?
}

class ChoresListPresenter {
    var viewController: ChoresListViewController? // TODO: needs an interface for better testing support
    var interactor: ChoresListInteractor?
    var navigator: ChoresListNavigator?
}

class ChoresListViewController: UIViewController {

    var presenter: ChoresListPresenter? // TODO needs an protocol for testing

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }

}

