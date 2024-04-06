//
//  TextIconImagePack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation
import UIKit

enum TextIconConfiguration: UInt8, CustomStringConvertible {
    case whole
    case oneLine
    case twoLine
    var description: String {
        switch self {
        case .whole:
            return "wh"
        case .oneLine:
            return "1l"
        case .twoLine:
            return "2l"
        }
    }
}

struct TextIcon: CustomStringConvertible {
    let name: String
    let image: UIImage
    let configuration: TextIconConfiguration
    let imageWidth: Int
    let imageHeight: Int
    let iconWidth: Int
    let iconHeight: Int
    init(name: String, image: UIImage, width: Int, height: Int, configuration: TextIconConfiguration) {
        self.name = name
        self.image = image
        self.iconWidth = width
        self.iconHeight = height
        self.configuration = configuration
        let _atlasWidth = Int(image.size.width + 0.5)
        if _atlasWidth > 0 {
            self.imageWidth = _atlasWidth
        } else {
            self.imageWidth = width
        }
        let _atlasHeight = Int(image.size.height + 0.5)
        if _atlasHeight > 0 {
            self.imageHeight = _atlasHeight
        } else {
            self.imageHeight = height
        }
    }
    
    var description: String {
        let _atlasWidth = Int(image.size.width + 0.5)
        let _atlasHeight = Int(image.size.height + 0.5)
        let isValid = _atlasWidth > 4 && _atlasHeight > 4
        let result = "TextIcon {\(name)} V: \(isValid), C: \(configuration), IMG: [\(imageWidth) x \(imageHeight)], ICN: [\(iconWidth) x \(iconHeight)]"
        return result
    }
    
}

enum TextIconImageSet {
    case phone(TextIcon, TextIcon, TextIcon,
               TextIcon, TextIcon, TextIcon)
    case tablet(TextIcon, TextIcon, TextIcon)
}

struct TextIconImagePack {
    
    //let image
    init(name: String,
         widthPhoneOneLineLandscape: Int,
         heightPhoneOneLineLandscape: Int,
         widthPhoneTwoLineLandscape: Int,
         heightPhoneTwoLineLandscape: Int,
         widthPhoneWholeLandscape: Int,
         heightPhoneWholeLandscape: Int,
         widthPhoneOneLinePortrait: Int,
         heightPhoneOneLinePortrait: Int,
         widthPhoneTwoLinePortrait: Int,
         heightPhoneTwoLinePortrait: Int,
         widthPhoneWholePortrait: Int,
         heightPhoneWholePortrait: Int,
         widthTabletOneLine: Int,
         heightTabletOneLine: Int,
         widthTabletTwoLine: Int,
         heightTabletTwoLine: Int,
         widthTabletWhole: Int,
         heightTabletWhole: Int) {
        
        self.widthPhoneOneLineLandscape = widthPhoneOneLineLandscape
        self.heightPhoneOneLineLandscape = heightPhoneOneLineLandscape
        self.widthPhoneTwoLineLandscape = widthPhoneTwoLineLandscape
        self.heightPhoneTwoLineLandscape = heightPhoneTwoLineLandscape
        self.widthPhoneWholeLandscape = widthPhoneWholeLandscape
        self.heightPhoneWholeLandscape = heightPhoneWholeLandscape
        self.widthPhoneOneLinePortrait = widthPhoneOneLinePortrait
        self.heightPhoneOneLinePortrait = heightPhoneOneLinePortrait
        self.widthPhoneTwoLinePortrait = widthPhoneTwoLinePortrait
        self.heightPhoneTwoLinePortrait = heightPhoneTwoLinePortrait
        self.widthPhoneWholePortrait = widthPhoneWholePortrait
        self.heightPhoneWholePortrait = heightPhoneWholePortrait
        self.widthTabletOneLine = widthTabletOneLine
        self.heightTabletOneLine = heightTabletOneLine
        self.widthTabletTwoLine = widthTabletTwoLine
        self.heightTabletTwoLine = heightTabletTwoLine
        self.widthTabletWhole = widthTabletWhole
        self.heightTabletWhole = heightTabletWhole
        
        if Device.isPad {
            
            let nameOneLine = name + "_po_1l"
            let nameTwoLine = name + "_po_2l"
            let nameWhole = name + "_po_wh"
            
            let imageOneLine = UIImage(named: nameOneLine) ?? UIImage()
            let imageTwoLine = UIImage(named: nameTwoLine) ?? UIImage()
            let imageWhole = UIImage(named: nameWhole) ?? UIImage()
            
            textIconImageSet = .tablet(TextIcon(name: name, image: imageWhole,
                                                width: widthTabletWhole, height: heightTabletWhole,
                                                configuration: .whole) ,
                                       TextIcon(name: name, image: imageOneLine,
                                                width: widthTabletOneLine, height: heightTabletOneLine,
                                                configuration: .oneLine),
                                       TextIcon(name: name, image: imageTwoLine,
                                                width: widthTabletTwoLine, height: heightTabletTwoLine,
                                                configuration: .twoLine))
        } else {
            
            let nameOneLinePortrait = name + "_po_1l"
            let nameTwoLinePortrait = name + "_po_2l"
            let nameWholePortrait = name + "_po_wh"
            
            let nameOneLineLandscape = name + "_ls_1l"
            let nameTwoLineLandscape = name + "_ls_2l"
            let nameWholeLandscape = name + "_ls_wh"
            
            let imageOneLinePortrait = UIImage(named: nameOneLinePortrait) ?? UIImage()
            let imageTwoLinePortrait = UIImage(named: nameTwoLinePortrait) ?? UIImage()
            let imageWholePortrait = UIImage(named: nameWholePortrait) ?? UIImage()
            
            let imageOneLineLandscape = UIImage(named: nameOneLineLandscape) ?? UIImage()
            let imageTwoLineLandscape = UIImage(named: nameTwoLineLandscape) ?? UIImage()
            let imageWholeLandscape = UIImage(named: nameWholeLandscape) ?? UIImage()
            
            textIconImageSet = .phone(TextIcon(name: name, image: imageWholePortrait,
                                               width: widthPhoneWholePortrait, height: heightPhoneWholePortrait,
                                               configuration: .whole) ,
                                      TextIcon(name: name, image: imageOneLinePortrait,
                                               width: widthPhoneOneLinePortrait, height: heightPhoneOneLinePortrait,
                                               configuration: .oneLine),
                                      TextIcon(name: name, image: imageTwoLinePortrait,
                                               width: widthPhoneTwoLinePortrait, height: heightPhoneTwoLinePortrait,
                                               configuration: .twoLine),
                                      TextIcon(name: name, image: imageWholeLandscape,
                                               width: widthPhoneWholeLandscape, height: heightPhoneWholeLandscape,
                                               configuration: .whole),
                                      TextIcon(name: name, image: imageOneLineLandscape,
                                               width: widthPhoneOneLineLandscape, height: heightPhoneOneLineLandscape,
                                               configuration: .oneLine),
                                      TextIcon(name: name, image: imageTwoLineLandscape,
                                               width: widthPhoneTwoLineLandscape, height: heightPhoneTwoLineLandscape,
                                               configuration: .twoLine))
        }
        print(textIconImageSet)
    }
    
    let widthPhoneOneLineLandscape: Int
    let heightPhoneOneLineLandscape: Int
    let widthPhoneTwoLineLandscape: Int
    let heightPhoneTwoLineLandscape: Int
    let widthPhoneWholeLandscape: Int
    let heightPhoneWholeLandscape: Int
    let widthPhoneOneLinePortrait: Int
    let heightPhoneOneLinePortrait: Int
    let widthPhoneTwoLinePortrait: Int
    let heightPhoneTwoLinePortrait: Int
    let widthPhoneWholePortrait: Int
    let heightPhoneWholePortrait: Int
    let widthTabletOneLine: Int
    let heightTabletOneLine: Int
    let widthTabletTwoLine: Int
    let heightTabletTwoLine: Int
    let widthTabletWhole: Int
    let heightTabletWhole: Int
    let textIconImageSet: TextIconImageSet
}
