//
//  ChoreDetailsViewController.swift
//  Chores
//
//  Created by Markus Kauppila on 13/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit
import SnapKit

class ChoreDetailsViewController: UIViewController {
    var presenter: ChoreDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Chore details", comment: "")
        view.backgroundColor = UIColor.white

        //self.automaticallyAdjustsScrollViewInsets = false
        //self.extendedLayoutIncludesOpaqueBars = true

        setupView()
        setupViewLayout()
    }


    let stackView = UIStackView()

    // but now all the views are created when the controller is initiliazed
    let label = UILabel()

    func setupView() {
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.alignment = UIStackViewAlignment.top
        stackView.distribution = UIStackViewDistribution.equalCentering
        stackView.spacing = 10.0
        view.addSubview(stackView)

        label.text = "hello world"
        label.backgroundColor = UIColor.red
        stackView.addArrangedSubview(label)
    }

    func setupViewLayout() {
        // This should probably be generalized into a base view controller
        self.view.layoutMargins = UIEdgeInsetsMake(44.0 + 20.0 + 16.0, 12.0, 16.0, 12.0)

        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.layoutMargins) //.inset(UIEdgeInsetsMake(16, 16, 16, 16))
        }
    }
}
