//
//  ItemCell.swift
//  Chores
//
//  Created by Markus Kauppila on 28/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit
import SnapKit

class CompletionMarkView: UIView {

}

class ItemCell: UITableViewCell {
    let itemNameLabel = UILabel()
    let pointsLabel = UILabel()
    let completionMarkView = CompletionMarkView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        // accessoryType = .detailDisclosureButton // HUOH: tapping only works with this type,
                                                   // not when using custom thing
        // TODO Define once on nav controller level and it'll cascade?
        layoutMargins = UIEdgeInsetsMake(16.0, 12.0, 16.0, 12.0)

        for subview in [itemNameLabel, pointsLabel, completionMarkView] as [UIView] {
            addSubview(subview)
        }
        completionMarkView.isUserInteractionEnabled = true
        accessoryView = completionMarkView

        itemNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.topMargin)
            make.leading.equalTo(snp.leadingMargin)
            make.trailing.equalTo(snp.trailingMargin).offset(-32);
        }

        pointsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemNameLabel.snp.bottomMargin).offset(8)
            make.leading.equalTo(snp.leadingMargin)
            make.bottom.equalTo(snp.bottomMargin)
        }

        completionMarkView.snp.updateConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(snp.trailingMargin)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        itemNameLabel.text = "Hello"
        pointsLabel.text = "world!"
        completionMarkView.backgroundColor = UIColor.black
    }
}
