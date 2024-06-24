//
//  ExpandDraggableMenuButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/20/24.
//

import UIKit

class ExpandDraggableMenuButton: DrawableButton {
    
    var imageExpanded = UIImage(named: "size_58") ?? UIImage()
    var imageCollapsed = UIImage(named: "size_80") ?? UIImage()
    
    
    var isExpanded = false
    required init(isExpanded: Bool) {
        
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        self.backgroundColor = UIColor.yellow
        
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    func update(isExpanded: Bool) {
        self.isExpanded = isExpanded
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        var image: UIImage
        if isExpanded {
            image = imageExpanded
        } else {
            image = imageCollapsed
        }
        
        let imageCenterX = bounds.origin.x + bounds.size.width / 2.0
        let imageCenterY = bounds.origin.y + bounds.size.height / 2.0
        let imgRect = CGRect(x: imageCenterX - image.size.width / 2.0,
                             y: imageCenterY - image.size.height / 2.0,
                             width: image.size.width,
                             height: image.size.height)
        if isPressed {
            image.draw(in: imgRect, blendMode: .normal, alpha: 0.75)
        } else {
            image.draw(in: imgRect, blendMode: .normal, alpha: 1.0)
        }
        
    }
    
}
