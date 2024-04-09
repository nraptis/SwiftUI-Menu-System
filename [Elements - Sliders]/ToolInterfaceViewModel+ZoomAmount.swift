//
//  ToolInterfaceViewModel+Zoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getZoomSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getZoomSliderConfiguration(widthCategory: widthCategory)
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelZoom = MagicalSliderViewModelZoom(jiggleViewModel: jiggleViewModel,
                                                                     toolInterfaceViewModel: self,
                                                                     sliderConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderZoom,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelZoom,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelZoom.refresh()
        return result
    }
    
    func getZoomSliderConfiguration(widthCategory: ToolInterfaceElementSliderWidthCategory) -> ToolInterfaceElementSliderConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextZoomLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextZoomLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        return ToolInterfaceElementSliderConfiguration(textIconImagePack: textIconImagePack,
                                                       orientation: orientation,
                                                       nameLabelLine1: textLine1,
                                                       nameLabelLine2: textLine2,
                                                       
                                                       friend_1_NameLabelLine1: nil,
                                                       friend_1_NameLabelLine2: nil,
                                                       
                                                       friend_2_NameLabelLine1: nil,
                                                       friend_2_NameLabelLine2: nil,
                                                       
                                                       friend_3_NameLabelLine1: nil,
                                                       friend_3_NameLabelLine2: nil,
                                                       
                                                       friend_4_NameLabelLine1: nil,
                                                       friend_4_NameLabelLine2: nil,
                                                       
                                                       minimumValue: JiggleScene.zoomMin,
                                                       maximumValue: JiggleScene.zoomMax,
                                                       valueWholeNumberCount: 2,
                                                       valueDecimalCount: 3,
                                                       widthCategory: widthCategory)
    }
}
