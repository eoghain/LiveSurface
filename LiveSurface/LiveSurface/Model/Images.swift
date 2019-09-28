//
//  Image.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation

// MARK: - Images
struct Images: Codable {
    let images: [String: LSImage]
}

// MARK: - Image
struct LSImage: Codable, Identifiable, Hashable {
    let index: Int
    let name: String
    let number: String
    let image: String
    let category: String
    let version: String
    let tags: Tags
    
    // compute id from index for Identifiable conformance
    var id: Int { index }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
    
    static func == (lhs: LSImage, rhs: LSImage) -> Bool {
        return rhs.index == lhs.index
    }
}

// MARK: - Tags
struct Tags: Codable {
    let sizedescription: String
    let sizescale: String
    let sizewidth: String
    let sizewidtharc: String
    let sizeheight: String
    let sizeheightarc, sizedepth, sizedeptharc: String
    let sizeunits: String
}
