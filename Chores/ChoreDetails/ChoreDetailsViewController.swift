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

    enum Constants {
        static let addButtonTitle = "Add chore!"
        static let viewTitle = NSLocalizedString("Chore details", comment: "")
        static let viewBackgroundColor = UIColor.white
        static let nameLabelTitle = "Name:"
        static let nameTextFieldPlaceholder = "name"
        static let pointsLabelTitle = "Points:"
        static let pointsTextFieldPlaceholder = "200"
        static let marginBetweenElements = 12.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewLayout()
    }

    // MARK: View Handling

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.nameLabelTitle
        return label
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.nameTextFieldPlaceholder
        return textField
    }()

    let pointsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.pointsLabelTitle
        return label
    }()

    let pointsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.pointsTextFieldPlaceholder
        return textField
    }()

    let addButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle(Constants.addButtonTitle, for: .normal)
        button.addTarget(self,
                         action: #selector(addChoreItemAction(sender:)),
                         for: .touchUpInside)
        return button
    }()

    func setupView() {
        title = Constants.viewTitle
        view.backgroundColor = Constants.viewBackgroundColor

        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(pointsLabel)
        view.addSubview(pointsTextField)
        view.addSubview(addButton)
    }

    func setupViewLayout() {
        // This should probably be generalized into a base view controller??
        view.layoutMargins = UIEdgeInsetsMake(44.0 + 20.0 + 16.0, 12.0, 16.0, 12.0)
        // Snapkit doesn't support layout margins? Or doesn't support top properly?

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(64 + Constants.marginBetweenElements)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottomMargin).offset(Constants.marginBetweenElements)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
        }

        pointsLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottomMargin).offset(Constants.marginBetweenElements)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
        }

        pointsTextField.snp.makeConstraints { make in
            make.top.equalTo(pointsLabel.snp.bottomMargin).offset(Constants.marginBetweenElements)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
        }

        addButton.snp.makeConstraints { make in
            make.top.equalTo(pointsTextField.snp.bottomMargin).offset(Constants.marginBetweenElements)
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
        }
    }

    // MARK: UI Actions

    @objc private func addChoreItemAction(sender: Any) {
        presenter?.addChoreItem(named: "hello", points: "akk")
    }
}

