//
//  ViewController.swift
//  Chores
//
//  Created by Markus Kauppila on 26/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListViewController: UITableViewController {
    var presenter: ChoresListPresenter? // TODO needs an protocol for testing

    let reuseIdentifier = "itemCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Chores"

        view.backgroundColor = UIColor.white

        tableView.register(CompletableItemTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        enableAutoResizingCellsFor(tableView: tableView)
    }

    private func enableAutoResizingCellsFor(tableView: UITableView) {
         //http://candycode.io/automatically-resizing-uitableviewcells-with-dynamic-text-height-using-auto-layout/
        tableView.estimatedRowHeight = 132.0
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                    for: indexPath) as? CompletableItemTableViewCell {
            cell.setup()
            cell.accessoryTapAction = {
                print("Accesory view tapped")
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select view")
    }
}
