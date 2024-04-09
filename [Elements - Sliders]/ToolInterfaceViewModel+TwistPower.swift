//
//  ToolInterfaceViewModel+TwistPower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

extension ToolInterfaceViewModel {
    func getTwistPowerSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getTwistPowerSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelTwistPower = MagicalSliderViewModelTwistPower(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderTwistPower,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelTwistPower,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelTwistPower.refresh()
        return result
    }
    
    func getTwistPowerSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextTwistPowerLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextTwistPowerLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        var friendLabelLine1: String?
        var friendLabelLine2: String?
        if widthCategory == .fullWidth {
            friendLabelLine1 = ToolInterfaceStringLibrary.interfaceTextTwistSpeedLine1()
            friendLabelLine2 = ToolInterfaceStringLibrary.interfaceTextTwistSpeedLine2()
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
                                                       
                                                       minimumValue: Jiggle.twistPowerMin,
                                                       maximumValue: Jiggle.twistPowerMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
