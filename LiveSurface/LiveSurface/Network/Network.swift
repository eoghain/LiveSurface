//
//  Network.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation
import Combine

struct Network {
    
    enum APIError: Error, LocalizedError {
        case unknown, apiError(reason: String)

        var errorDescription: String? {
            switch self {
            case .unknown:
                return "Unknown error"
            case .apiError(let reason):
                return reason
            }
        }
    }

    func fetch(url: URL) -> AnyPublisher<Data, APIError> {
        let request = URLRequest(url: url)

        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
}
