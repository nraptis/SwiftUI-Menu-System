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
        let textIconImagePack = configuration.textIconImagePack
        let minimumWidth = IconButtonLayout.getIconWidthWithUniversalPadding(textIconImagePack: textIconImagePack,
                                                                             orientation: orientation, squeeze: .squeezed,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        let standardWidth = IconButtonLayout.getIconWidthWithUniversalPadding(textIconImagePack: textIconImagePack,
                                                                              orientation: orientation, squeeze: .standard,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        let flexTextIconButtonData = FlexIconButtonData(minimumWidth: minimumWidth,
                                                        standardWidth: standardWidth,
                                                        maximumWidth: standardWidth + 4)
        return ToolInterfaceElementFlex.iconButton(flexTextIconButtonData)
    }
}
