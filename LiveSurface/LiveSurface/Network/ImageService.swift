//
//  ImageService.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ImageService {
    static let shared = ImageService()
    
    enum ImageError: Error {
        case decodingError
    }
    
    func fetchImage(path: String) -> AnyPublisher<UIImage?, Never> {
        guard let url = URL(string: path) else { fatalError("Invalid URL: \(path)") }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> UIImage? in
                return UIImage(data: data)
        }.catch { error in
            return Just(nil)
        }
        .eraseToAnyPublisher()
    }
}
