//
//  ArrayExtensions.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
