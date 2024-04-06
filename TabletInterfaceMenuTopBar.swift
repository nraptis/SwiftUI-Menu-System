//
//  TabletInterfaceMenuTopBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import UIKit

class TabletInterfaceMenuTopBar: UIView {
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        backgroundColor = UIColor.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
