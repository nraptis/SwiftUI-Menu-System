//
//  ToolInterfaceViewModel+RowsAdapt.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/18/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func adaptAllRows() {
        
        toolConfigurationIdiomPrevious = toolConfigurationIdiomCurrent
        toolConfigurationIdiomCurrent = calculateToolConfigurationIdiom()
        
        let isReversed = getIsReversed(fromIdiom: toolConfigurationIdiomPrevious,
                                       toIdiom: toolConfigurationIdiomCurrent)
        
        if Device.isPad {
            adaptAllRowsPad(isReversed: isReversed)
        } else {
            adaptAllRowsPhone(isReversed: isReversed)
        }
    }
    
    func getIsReversed(fromIdiom: ToolConfigurationIdiom, toIdiom: ToolConfigurationIdiom) -> Bool {
        return Bool.random()
    }
    
    func adaptAllRowsPad(isReversed: Bool) {
        updateRow(slot: .top_Primary,
                  rowBluePrint: getRowBluePrint_Top_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
        updateRow(slot: .top_Secondary1,
                  rowBluePrint: getRowBluePrint_Top_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
        updateRow(slot: .top_Secondary2,
                  rowBluePrint: getRowBluePrint_Top_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
        
        updateRow(slot: .bottom_Secondary2,
                  rowBluePrint: getRowBluePrint_Bottom_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
        updateRow(slot: .bottom_Secondary1,
                  rowBluePrint: getRowBluePrint_Bottom_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
        updateRow(slot: .bottom_Primary,
                  rowBluePrint: getRowBluePrint_Bottom_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent),
                  reversed: isReversed)
    }
    
    func adaptAllRowsPhone(isReversed: Bool) {
        
    }
    
    
}
