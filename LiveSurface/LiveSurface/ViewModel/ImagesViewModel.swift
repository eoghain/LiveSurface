//
//  ImagesViewModel.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class ImagesViewModel: ObservableObject {
    @Published var images: Images = Images(images: [:])
    
    init() {
        load()
    }

    func load() {
        guard let url = URL(string: "https://www.livesurface.com/test/api/images.php?key=850f99c8-5cfe-4c7a-81bf-555747a7d865") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let images = try JSONDecoder().decode(Images.self, from: data)
                DispatchQueue.main.async {
                    self.images = images
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}
