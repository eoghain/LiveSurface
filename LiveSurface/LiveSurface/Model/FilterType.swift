//
//  FilterType.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation

enum FilterType : String, Codable {
    case none = ""
    case chrome = "CIPhotoEffectChrome"
    case fade = "CIPhotoEffectFade"
    case instant = "CIPhotoEffectInstant"
    case mono = "CIPhotoEffectMono"
    case noir = "CIPhotoEffectNoir"
    case process = "CIPhotoEffectProcess"
    case tonal = "CIPhotoEffectTonal"
    case transfer =  "CIPhotoEffectTransfer"
    
    init(rawValue: String) {
        switch rawValue {
        case "CIPhotoEffectChrome": self = .chrome
        case "CIPhotoEffectFade": self = .fade
        case "CIPhotoEffectInstant": self = .instant
        case "CIPhotoEffectMono": self = .mono
        case "CIPhotoEffectNoir": self = .noir
        case "CIPhotoEffectProcess": self = .process
        case "CIPhotoEffectTonal": self = .tonal
        case "CIPhotoEffectTransfer": self = .transfer
        default: self = .none
        }
    }
}
