//
//  ToolInterfaceElementFlex.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

struct FlexSegmentData {
    let minimumWidthLong: Int
    let middle1WidthLong: Int
    let middle2WidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let middle1WidthStackedLarge: Int
    let middle2WidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let middle1WidthStackedMedium: Int
    let middle2WidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let middle1WidthStackedSmall: Int
    let middle2WidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

struct FlexSliderData {
    let widthCategory: ToolInterfaceElementSliderWidthCategory
}

struct FlexSpacerData {
    let defaultWidth: Int
}

struct FlexDividerData {
    let minimumWidth: Int
    let standardWidth: Int
}

struct FlexTextIconButtonData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

struct FlexIconButtonData {
    let minimumWidth: Int
    let standardWidth: Int
    let maximumWidth: Int
}

struct FlexCheckBoxData {
    let minimumWidthLong: Int
    let standardWidthLong: Int
    let maximumWidthLong: Int
    
    let minimumWidthStackedLarge: Int
    let standardWidthStackedLarge: Int
    let maximumWidthStackedLarge: Int
    
    let minimumWidthStackedMedium: Int
    let standardWidthStackedMedium: Int
    let maximumWidthStackedMedium: Int
    
    let minimumWidthStackedSmall: Int
    let standardWidthStackedSmall: Int
    let maximumWidthStackedSmall: Int
}

enum ToolInterfaceElementFlex {
    case fixed(Int)
    
    case spacer(FlexSpacerData)
    
    case divider(FlexDividerData)
    case dividerSpacerDivider(FlexDividerData)
    
    case iconButton(FlexIconButtonData)
    case textIconButton(FlexTextIconButtonData)
    
    case segment(FlexSegmentData)
    
    case slider(FlexSliderData)
    
    case checkBox(FlexCheckBoxData)
}
