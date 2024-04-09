//
//  ToolInterfaceViewModel+JiggleSpeedNew.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import Foundation

extension ToolInterfaceViewModel {
    func getJiggleSpeedSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getJiggleSpeedSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleSpeed = MagicalSliderViewModelJiggleSpeed(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderJiggleSpeed,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelJiggleSpeed,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelJiggleSpeed.refresh()
        return result
    }
    
    func getJiggleSpeedSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextJiggleSpeedLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextJiggleSpeedLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        var friendLabelLine1: String?
        var friendLabelLine2: String?
        if widthCategory == .fullWidth {
            friendLabelLine1 = ToolInterfaceStringLibrary.interfaceTextJigglePowerLine1()
            friendLabelLine2 = ToolInterfaceStringLibrary.interfaceTextJigglePowerLine1()
        }
        
        return ToolInterfaceElementSliderConfiguration(textIconImagePack: textIconImagePack,
                                                       orientation: orientation,
                                                       nameLabelLine1: textLine1,
                                                       nameLabelLine2: textLine2,
                                                       
                                                       friend_1_NameLabelLine1: friendLabelLine1,
                                                       friend_1_NameLabelLine2: friendLabelLine2,
                                                       
                                                       friend_2_NameLabelLine1: nil,
                                                       friend_2_NameLabelLine2: nil,
                                                       
                                                       friend_3_NameLabelLine1: nil,
                                                       friend_3_NameLabelLine2: nil,
                                                       
                                                       friend_4_NameLabelLine1: nil,
                                                       friend_4_NameLabelLine2: nil,
                                                       
                                                       minimumValue: Jiggle.jiggleSpeedAmountMin,
                                                       maximumValue: Jiggle.jiggleSpeedAmountMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
