//
//  ViewController.swift
//  Chores
//
//  Created by Markus Kauppila on 26/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoresListViewController: UITableViewController {
    var presenter: ChoresListPresenter?

    enum Constants {
        static let viewTitle = NSLocalizedString("Chores", comment: "")
        static let viewBackgroundColor = AppColor.white
        static let completableItemTableViewCellIdentifier = "completableItemTableViewCellIdentifier"
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title = Constants.viewTitle
        view.backgroundColor = Constants.viewBackgroundColor

        tableView.register(CompletableItemTableViewCell.self,
                forCellReuseIdentifier: Constants.completableItemTableViewCellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        let addChoreButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                target: self,
                action: #selector(openAddChoreView(sender:)))
        navigationItem.rightBarButtonItem = addChoreButtonItem

        enableAutoResizingCellsFor(tableView: tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    private func enableAutoResizingCellsFor(tableView: UITableView) {
        //http://candycode.io/automatically-resizing-uitableviewcells-with-dynamic-text-height-using-auto-layout/
        tableView.estimatedRowHeight = 132.0
        tableView.rowHeight = UITableViewAutomaticDimension

        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
    }
}

extension ChoresListViewController {
    // MARK: UITableViewDelegate and UITableViewDataSource

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.completableItemTableViewCellIdentifier,
                for: indexPath) as? CompletableItemTableViewCell {
            if let item = presenter?.itemAtIndexPath(indexPath: indexPath) {
                cell.setup(withItem: item)
                cell.accessoryTapAction = {
                    self.markChoreItemCompleted()
                }
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfItems() ?? 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openChoreDetailsView()
    }
}

fileprivate extension ChoresListViewController {
    // MARK: UI Actions

    @objc func openAddChoreView(sender: Any) {
        print("Open add new chore item")
        presenter?.onOpenAddChoreView()
    }

    func markChoreItemCompleted(/*this item*/) {
        print("mark chore item completed")
        presenter?.onMarkChoreItemCompleted()
    }

    func openChoreDetailsView() {
        print("Open details view for chore item")
        presenter?.onOpenChoreDetailsView()
    }
}
