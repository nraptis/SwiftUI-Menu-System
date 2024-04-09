//
//  ToolInterfaceViewModel+BouncePower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    func getBouncePowerSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getBouncePowerSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelBouncePower = MagicalSliderViewModelBouncePower(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderBouncePower,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelBouncePower,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelBouncePower.refresh()
        return result
    }
    
    func getBouncePowerSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextBouncePowerLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextBouncePowerLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        var friendLabelLine1: String?
        var friendLabelLine2: String?
        if widthCategory == .fullWidth {
            friendLabelLine1 = ToolInterfaceStringLibrary.interfaceTextBounceSpeedLine1()
            friendLabelLine2 = ToolInterfaceStringLibrary.interfaceTextBounceSpeedLine2()
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
                                                       
                                                       minimumValue: Jiggle.bouncePowerMin,
                                                       maximumValue: Jiggle.bouncePowerMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
