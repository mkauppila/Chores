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

class ChoresListViewController: UITableViewController {
    var presenter: ChoresListPresenter? // TODO needs an protocol for testing

    let reuseIdentifier = "itemCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Chores"

        view.backgroundColor = UIColor.white

        tableView.register(ItemCell.self, forCellReuseIdentifier: reuseIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        enableAutoResizingCellsFor(tableView: tableView)
    }

    func enableAutoResizingCellsFor(tableView: UITableView) {
         //http://candycode.io/automatically-resizing-uitableviewcells-with-dynamic-text-height-using-auto-layout/
        tableView.estimatedRowHeight = 132.0
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                    for: indexPath) as? ItemCell {
            cell.setup()
            return cell
        } else {
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    override func tableView(_ tableView: UITableView,
                            accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accessory tapped")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select view")
    }
}
