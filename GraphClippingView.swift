//
//  GraphClippingView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/1/24.
//

import UIKit

class GraphClippingView: UIView {
    
    let insetLeft: Int
    let insetRight: Int
    let insetTop: Int
    let insetBottom: Int
    let cornerRadius: Int
    required init(insetLeft: Int, insetRight: Int, insetTop: Int, insetBottom: Int, cornerRadius: Int) {
        self.insetLeft = insetLeft
        self.insetRight = insetRight
        self.insetTop = insetTop
        self.insetBottom = insetBottom
        self.cornerRadius = cornerRadius
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        isOpaque = false
        isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let cutOutRect = CGRect(x: bounds.origin.x + CGFloat(insetLeft),
                                y: bounds.origin.y + CGFloat(insetTop),
                                width: bounds.size.width - CGFloat(insetLeft + insetRight),
                                height: bounds.size.height - CGFloat(insetTop + insetBottom))
        let rectPath = UIBezierPath(rect: bounds)
        let cutOutPath = UIBezierPath(roundedRect: cutOutRect, cornerRadius: CGFloat(cornerRadius))
        context.saveGState()
        context.addPath(rectPath.cgPath)
        context.addPath(cutOutPath.cgPath)
        context.setFillColor(ToolInterfaceTheme._toolbarBackground.cgColor)
        //context.setFillColor(UIColor.red.withAlphaComponent(0.5).cgColor)
        
        context.fillPath(using: .evenOdd)
        context.restoreGState()
        
        context.saveGState()
        context.addPath(cutOutPath.cgPath)
        context.setStrokeColor(ToolInterfaceTheme._gray975.cgColor)
        context.setLineWidth(Device.isPad ? 2.0 : 1.0)
        context.strokePath()
        context.restoreGState()
    }
}

