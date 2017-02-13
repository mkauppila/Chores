//
//  ItemCell.swift
//  Chores
//
//  Created by Markus Kauppila on 28/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit
import SnapKit

class CompletableItemTableViewCell: UITableViewCell {
    let itemNameLabel = UILabel()
    let pointsLabel = UILabel()
    let completionMarkView = CompletionMarkView()

    var accessoryTapAction: () -> () = {}

    @objc private func tap(recognizer: UIGestureRecognizer) {
        completionMarkView.completed = !completionMarkView.completed
        completionMarkView.setNeedsDisplay()
        accessoryTapAction()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        accessoryType = .disclosureIndicator
        // TODO: Define once on nav controller level and it'll cascade?
        layoutMargins = UIEdgeInsetsMake(16.0, 12.0, 16.0, 12.0)
        completionMarkView.backgroundColor = UIColor.white

        for subview in [itemNameLabel, pointsLabel, completionMarkView] as [UIView] {
            addSubview(subview)
        }

        addTapRecognizerTo(view: completionMarkView)
        createLayout()

        stylizeLabels()
    }

    private func addTapRecognizerTo(view: UIView) {
        view.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        view.addGestureRecognizer(recognizer)
    }

    private func createLayout() {
        itemNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.topMargin)
            make.leading.equalTo(snp.leadingMargin)
            make.trailing.equalTo(completionMarkView.snp.leading).offset(-8)
        }

        pointsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemNameLabel.snp.bottomMargin).offset(12)
            make.leading.equalTo(snp.leadingMargin)
            make.trailing.equalTo(completionMarkView.snp.leading).offset(-8)
            make.bottom.equalTo(snp.bottomMargin)
        }

        completionMarkView.snp.updateConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(snp.trailingMargin).offset(-16)
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
    }

    private func stylizeLabels() {
        itemNameLabel.font = UIFont.systemFont(ofSize: 22.0)
        pointsLabel.font = UIFont.italicSystemFont(ofSize: 14)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(withItem item: ChoreItem) {
        itemNameLabel.text = item.name
        pointsLabel.text = "\(item.points) points!"
        completionMarkView.completed = item.completed
    }
}
