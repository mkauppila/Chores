//
//  ChoreDetailsViewController.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

class ChoreDetailsViewController: UIViewController {
    var presenter: ChoreDetailsNavigator?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Chore details", comment: "")
        view.backgroundColor = UIColor.blue
    }

}
