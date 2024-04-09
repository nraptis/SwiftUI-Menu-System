//
//  ToolInterfaceViewModel+TwistSpeed.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getTwistSpeedSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getTwistSpeedSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelTwistSpeed = MagicalSliderViewModelTwistSpeed(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderTwistSpeed,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelTwistSpeed,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelTwistSpeed.refresh()
        return result
    }
    
    func getTwistSpeedSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextTwistSpeedLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextTwistSpeedLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        var friendLabelLine1: String?
        var friendLabelLine2: String?
        if widthCategory == .fullWidth {
            friendLabelLine1 = ToolInterfaceStringLibrary.interfaceTextTwistPowerLine1()
            friendLabelLine2 = ToolInterfaceStringLibrary.interfaceTextTwistPowerLine2()
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
                                                       
                                                       minimumValue: Jiggle.twistSpeedMin,
                                                       maximumValue: Jiggle.twistSpeedMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
