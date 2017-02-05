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

    let completableItemTableViewCellIdentifier = "completableItemTableViewCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("Chores", comment: "")

        view.backgroundColor = UIColor.white

        tableView.register(CompletableItemTableViewCell.self,
                           forCellReuseIdentifier: completableItemTableViewCellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        let addChoreButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(openAddChoreView(sender:)))
        navigationItem.rightBarButtonItem = addChoreButtonItem

        enableAutoResizingCellsFor(tableView: tableView)
    }

    private func enableAutoResizingCellsFor(tableView: UITableView) {
         //http://candycode.io/automatically-resizing-uitableviewcells-with-dynamic-text-height-using-auto-layout/
        tableView.estimatedRowHeight = 132.0
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }

    // MARK: UITableViewDelegate and UITableViewDataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: completableItemTableViewCellIdentifier,
                                                    for: indexPath) as? CompletableItemTableViewCell {
            cell.setup()
            cell.accessoryTapAction = {
                self.markChoreItemCompleted()
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
        openChoreDetailsView()
    }

    // MARK: UI Actions

    @objc private func openAddChoreView(sender: Any) {
        print("Open add new chore item")
    }

    private func markChoreItemCompleted(/*this item*/) {
        print("mark chore item completed")
    }

    private func openChoreDetailsView() {
        print("Open details view for chore item")
    }
}
