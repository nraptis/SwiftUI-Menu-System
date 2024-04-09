//
//  ToolInterfaceViewModel+BounceSpeed.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getBounceSpeedSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getBounceSpeedSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelBounceSpeed = MagicalSliderViewModelBounceSpeed(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderBounceSpeed,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelBounceSpeed,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelBounceSpeed.refresh()
        return result
    }
    
    func getBounceSpeedSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextBounceSpeedLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextBounceSpeedLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        var friendLabelLine1: String?
        var friendLabelLine2: String?
        if widthCategory == .fullWidth {
            friendLabelLine1 = ToolInterfaceStringLibrary.interfaceTextBouncePowerLine1()
            friendLabelLine2 = ToolInterfaceStringLibrary.interfaceTextBouncePowerLine2()
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
                                                       
                                                       minimumValue: Jiggle.bounceSpeedMin,
                                                       maximumValue: Jiggle.bounceSpeedMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
