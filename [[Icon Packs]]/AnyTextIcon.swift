//
//  AnyTextIcon.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation
import UIKit

class AnyTextIcon: TextIconable, CustomStringConvertible {
    let fileName: String
    private var _image: UIImage?
    func getImage() -> UIImage {
        if let image = _image {
            return image
        } else if let image = UIImage(named: fileName) {
            _image = image
            return image
        } else {
            let image = UIImage()
            _image = image
            return image
        }
    }
    
    let imageWidth: Int
    let imageHeight: Int
    var iconX: Int
    var iconY: Int
    let iconWidth: Int
    let iconHeight: Int
    var device: TextIconDevice
    var orientation: Orientation?
    init(fileName: String,
         device: TextIconDevice,
         orientation: Orientation?,
         imageWidth: Int,
         imageHeight: Int,
         iconX: Int,
         iconY: Int,
         iconWidth: Int,
         iconHeight: Int) {
        self.fileName = fileName
        self.device = device
        self.orientation = orientation
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.iconX = iconX
        self.iconY = iconY
        self.iconWidth = iconWidth
        self.iconHeight = iconHeight
    }
    
    var description: String {
        let image = getImage()
        let _atlasWidth = Int(image.size.width + 0.5)
        let _atlasHeight = Int(image.size.height + 0.5)
        let isValid = _atlasWidth > 4 && _atlasHeight > 4
        let result = "TextIcon {\(fileName)} V: \(isValid), IMG: [\(imageWidth) x \(imageHeight)], ICN: [\(iconWidth) x \(iconHeight)]"
        return result
    }
}
