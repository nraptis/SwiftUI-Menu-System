//
//  ExpandToolbarButton.swift
//  Bounce
//
//  Created by Raptis, Nicholas on 9/28/17.
//  Copyright © 2017 Darkswarm LLC. All rights reserved.
//

import UIKit

class ExpandToolbarButton: DrawableButton, UIGestureRecognizerDelegate {
    
    var image: UIImage?
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let result = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        return result
    }()
    
    var isDragging = false
    var dragStartGestureX = CGFloat(0.0)
    var dragStartConstraintLeft = CGFloat(0.0)
    var dragWobbleSin = CGFloat(0.0)
    var dragWobbleDamper = CGFloat(0.0)
    var safeWidth = CGFloat(255.0)
    
    var isAtTopOfScreen: Bool = false
    weak var leftConstraint: NSLayoutConstraint?
    required init(isAtTopOfScreen: Bool) {
        self.isAtTopOfScreen = isAtTopOfScreen
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor.clear
        
        if Device.isPhone {
            if isAtTopOfScreen {
                image = UIImage(named: "button_expand_down_iphone")
            } else {
                image = UIImage(named: "button_expand_up_iphone")
            }
        } else {
            if isAtTopOfScreen {
                image = UIImage(named: "button_expand_down_ipad")
            } else {
                image = UIImage(named: "button_expand_up_ipad")
            }
        }
        
        setNeedsDisplay()
        
        longPressRecognizer.cancelsTouchesInView = true
        longPressRecognizer.delegate = self
        addGestureRecognizer(longPressRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    func update(deltaTime: Float, safeWidth: CGFloat) {
        
        self.safeWidth = safeWidth
        
        if isDragging {
            dragWobbleDamper += CGFloat(deltaTime) * 4.0
            if dragWobbleDamper > 1.0 {
                dragWobbleDamper = 1.0
            }
        }
        
        if dragWobbleDamper > 0.0 {
            dragWobbleSin += CGFloat(deltaTime) * 8.0
            if dragWobbleSin > CGFloat(Math.pi2) {
                dragWobbleSin -= CGFloat(Math.pi2)
            }
            if isDragging == false {
                dragWobbleDamper -= CGFloat(deltaTime) * 3.0
                if dragWobbleDamper < 0.0 {
                    dragWobbleDamper = 0.0
                }
            }
            updateTransform()
        } else {
            dragWobbleSin = CGFloat(Math.pi_2)
        }
    }
    
    func updateTransform() {
        var transform = CGAffineTransform.identity
        
        if dragWobbleDamper <= 0.0 {
            dragWobbleDamper = 0.0
        } else {
            
            let scale = 1.0 + dragWobbleDamper * 0.25
            let rotation = CGFloat(sinf(Float(dragWobbleSin))) * 0.075 * dragWobbleDamper
            
            var translateAmount = CGFloat(0.0)
            if !isAtTopOfScreen { 
                translateAmount = -12.0
            }
            
            translateAmount *= dragWobbleDamper
            
            transform = transform.translatedBy(x: 0.0, y: translateAmount)
            transform = transform.rotated(by: rotation)
            transform = transform.scaledBy(x: scale, y: scale)
        }
        self.transform = transform
    }
    
    override func draw(_ rect: CGRect) {
        if let img = image {
            let imageCenterX = bounds.origin.x + bounds.size.width / 2.0
            let imageCenterY = bounds.origin.y + bounds.size.height / 2.0
            let imgRect = CGRect(x: imageCenterX - img.size.width / 2.0, 
                                 y: imageCenterY - img.size.height / 2.0,
                                 width: img.size.width,
                                 height: img.size.height)
            if isPressed {
                img.draw(in: imgRect, blendMode: .normal, alpha: 0.75)
            } else {
                img.draw(in: imgRect, blendMode: .normal, alpha: 1.0)
            }
        }
    }
    
    @objc func handleLongPress() {
        guard let rootView = ApplicationController.rootViewController.view else {
            return
        }
        let point = longPressRecognizer.location(in: rootView)
        switch(longPressRecognizer.state) {
        case .began:
            dragStartGestureX = point.x
            dragStartConstraintLeft = 0.0
            if let leftConstraint = leftConstraint {
                dragStartConstraintLeft = leftConstraint.constant
            }
            isDragging = true
            break
        case .changed:
            if isDragging {
                if let leftConstraint = leftConstraint {
                    let dragMaxX = safeWidth - bounds.width
                    let dragMinX = CGFloat(0.0)
                    var newLeft = dragStartConstraintLeft + (point.x - dragStartGestureX)
                    if newLeft < dragMinX { newLeft = dragMinX }
                    if newLeft > dragMaxX { newLeft = dragMaxX }
                    leftConstraint.constant = newLeft
                    updateTransform()
                }
            }
            break
        default:
            isDragging = false
            break
        }
    }
}
