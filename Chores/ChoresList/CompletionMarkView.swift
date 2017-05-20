//
//  CompletionMarkView.swift
//  Chores
//
//  Created by Markus Kauppila on 05/02/17.
//  Copyright © 2017 Markus Kauppila. All rights reserved.
//

import UIKit

@IBDesignable
class CompletionMarkView: UIView {

    @IBInspectable var pathColor = AppColor.appleGray
    @IBInspectable var circleLineWidth: CGFloat = 2.0
    @IBInspectable var checkmarkLineWidth: CGFloat = 5.0
    @IBInspectable var completed: Bool = false

    override func draw(_ rect: CGRect) {
        if let backgroundColor = backgroundColor {
            // TODO: Refactor the circle and checkmark into single layer
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
