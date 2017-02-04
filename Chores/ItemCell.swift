//
//  ItemCell.swift
//  Chores
//
//  Created by Markus Kauppila on 28/01/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit
import SnapKit

// TODO: https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1

extension UIColor {
    class var appleGray: UIColor {
        get {
            return UIColor(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        }
    }
}


@IBDesignable
class CompletionMarkView: UIView {

    @IBInspectable var circleColor: UIColor
    @IBInspectable var lineWidth: CGFloat
    @IBInspectable var completed: Bool

    override init(frame: CGRect) {
        circleColor = UIColor.appleGray
        lineWidth = 2.0
        completed = false

        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // TODO should I implement this in order to support xibs?
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        if let backgroundColor = backgroundColor {
            let circlePath = UIBezierPath(ovalIn: rect)

            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            shapeLayer.fillColor = backgroundColor.cgColor
            shapeLayer.strokeColor = circleColor.cgColor
            shapeLayer.lineWidth = lineWidth

            layer.addSublayer(shapeLayer)
        } else {
            print("CompletionMarkView requires a background color!")
        }
    }
}

// TODO rename to CompletableItemTableViewCell
class ItemCell: UITableViewCell {
    let itemNameLabel = UILabel()
    let pointsLabel = UILabel()
    let completionMarkView = CompletionMarkView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        accessoryType = .disclosureIndicator
        // TODO Define once on nav controller level and it'll cascade?
        layoutMargins = UIEdgeInsetsMake(16.0, 12.0, 16.0, 12.0)

        for subview in [itemNameLabel, pointsLabel, completionMarkView] as [UIView] {
            addSubview(subview)
        }

        completionMarkView.isUserInteractionEnabled = true

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
            make.trailing.equalTo(snp.trailingMargin).offset(-16);
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        itemNameLabel.text = "Hello"
        pointsLabel.text = "world!"
        completionMarkView.backgroundColor = UIColor.white
    }
}
