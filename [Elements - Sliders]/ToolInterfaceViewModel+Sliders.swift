//
//  ToolInterfaceViewModel+TextIconSliders.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSliderFlex(orientation: Orientation,
                              configuration: ToolInterfaceElementSliderConfiguration,
                              neighborTypeLeft: ToolInterfaceElementType?,
                              neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let widthCategory = configuration.widthCategory
        let flexSliderData = FlexSliderData(widthCategory: widthCategory)
        return ToolInterfaceElementFlex.slider(flexSliderData)
    }
}
