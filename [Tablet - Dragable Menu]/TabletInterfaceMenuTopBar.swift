//
//  TabletInterfaceMenuTopBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import UIKit

class TabletInterfaceMenuTopBar: UIView {
    
    lazy var expandCollapseButton: ExpandDraggableMenuButton = {
       
        var isExpanded = true
        if let jiggleViewController = toolInterfaceViewModel.jiggleViewController {
            if jiggleViewController.isDraggableMenuExpanded {
                isExpanded = true
            } else {
                isExpanded = false
            }
        }
        
        let result = ExpandDraggableMenuButton(isExpanded: isExpanded)
        result.translatesAutoresizingMaskIntoConstraints = false
        
        
        //check_box_remove_points_phone_po_0l
        
        
        return result
    }()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel, orientation: Orientation) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        backgroundColor = ToolInterfaceTheme._gray200
        
        if let jvc = toolInterfaceViewModel.jiggleViewController {
            print("jvcjvc = \(jvc.isDraggableMenuExpanded)")
        }
    
        addSubview(expandCollapseButton)
        expandCollapseButton.addConstraints([
        
            NSLayoutConstraint(item: expandCollapseButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0),
        ])
        
        addConstraints([
            NSLayoutConstraint(item: expandCollapseButton, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: -12.0),
            NSLayoutConstraint(item: expandCollapseButton, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: expandCollapseButton, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            
            
        ])
        
        expandCollapseButton.addTarget(self, action: #selector(clickExpandCollapse), for: .touchUpInside)
        
    }
    
    @objc func clickExpandCollapse() {
        
        print("clickExpandCollapse")
        if let jiggleViewController = toolInterfaceViewModel.jiggleViewController {
            jiggleViewController.toggleExpandCollapseDraggableMenu()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
