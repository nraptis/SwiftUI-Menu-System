//
//  ToolInterfaceViewModel+IconButtons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getIconButtonFlex(orientation: Orientation,
                                  configuration: ToolInterfaceElementIconButtonConfiguration,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let minimumWidth = IconButtonLayout.getIconWidthWithUniversalPadding(iconPack: iconPack,
                                                                             orientation: orientation, squeeze: .squeezed,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        let standardWidth = IconButtonLayout.getIconWidthWithUniversalPadding(iconPack: iconPack,
                                                                              orientation: orientation, squeeze: .standard,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        let flexTextIconButtonData = FlexIconButtonData(minimumWidth: minimumWidth,
                                                        standardWidth: standardWidth,
                                                        maximumWidth: standardWidth)
        return ToolInterfaceElementFlex.iconButton(flexTextIconButtonData)
    }
}
