//
//  TabletInterfaceMenuBottomBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/20/24.
//

import UIKit

class TabletInterfaceMenuBottomBar: UIView {

    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        backgroundColor = ToolInterfaceTheme._gray200
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
