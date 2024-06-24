//
//  TextIconable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import UIKit

protocol TextIconable {
    var fileName: String { get }
    var imageWidth: Int { get }
    var imageHeight: Int { get }
    var iconX: Int { get }
    var iconY: Int { get }
    var iconWidth: Int { get }
    var iconHeight: Int { get }
    var device: TextIconDevice { get }
    var orientation: Orientation? { get }
    func getImage() -> UIImage
}
