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

    @IBInspectable var pathColor: UIColor = UIColor.appleGray
    @IBInspectable var circleLineWidth: CGFloat = 2.0
    @IBInspectable var checkmarkLineWidth: CGFloat = 5.0
    @IBInspectable var completed: Bool = false

    override func draw(_ rect: CGRect) {
        if let backgroundColor = backgroundColor {
            layer.addSublayer(circleLayer(rect: rect, backgroundColor: backgroundColor))
            if completed {
                layer.addSublayer(checkmarkLayer(rect: rect, backgroundColor: backgroundColor))
            }
        } else {
            assert(false, "CompletionMarkView requires a background color!")
        }
    }

    private func circleLayer(rect: CGRect, backgroundColor: UIColor) -> CALayer {
        let circlePath = UIBezierPath(ovalIn: rect)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = backgroundColor.cgColor
        shapeLayer.strokeColor = pathColor.cgColor
        shapeLayer.lineWidth = circleLineWidth

        return shapeLayer
    }

    private func checkmarkLayer(rect: CGRect, backgroundColor: UIColor) -> CALayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width * 0.25, y: rect.height * 0.5))
        path.addLine(to: CGPoint(x: rect.width * 0.45, y: rect.height * 0.7))
        path.addLine(to: CGPoint(x: rect.width * 0.75, y: rect.height * 0.3))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = backgroundColor.cgColor
        shapeLayer.strokeColor = pathColor.cgColor
        shapeLayer.lineWidth = checkmarkLineWidth

        return shapeLayer
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
