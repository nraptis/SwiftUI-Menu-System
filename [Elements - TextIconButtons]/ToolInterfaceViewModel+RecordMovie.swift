//
//  ToolInterfaceViewModel+RecordMovie.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRecordMovieTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRecordMovieLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRecordMovieLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRecordMovie = MagicalTextIconButtonViewModelRecordMovie(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let recordMovieToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonRecordMovie, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelRecordMovie, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelRecordMovie.refresh()
        return recordMovieToolNode
    }
}
