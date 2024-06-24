//
//  TextIconPackable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

enum TextIconDevice {
    case pad
    case phone
}

protocol TextIconPackable {
    func getTextIcon(orientation: Orientation, 
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int) -> (any TextIconable)
}
