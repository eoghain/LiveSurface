//
//  Image.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let images = try? newJSONDecoder().decode(Images.self, from: jsonData)

import Foundation

// MARK: - Images
struct Images: Codable {
    let images: [String: Image]
}

// MARK: - Image
struct Image: Codable {
    let index: Int
    let name: String
    let number: String
    let image: String
    let category: Category
    let version: String
    let tags: Tags
}

enum Category: String, Codable {
    case categoryDefault = "category.default"
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
