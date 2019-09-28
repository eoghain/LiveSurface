//
//  ImageLoader.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class ImageLoaderCache {
    static let shared = ImageLoaderCache()
    
    var loaders: NSCache<NSString, ImageLoader> = NSCache()
            
    func loaderFor(path: String?) -> ImageLoader {
        let key = NSString(string: "\(path ?? "missing")")
        if let loader = loaders.object(forKey: key) {
            return loader
        } else {
            let loader = ImageLoader(path: path)
            loaders.setObject(loader, forKey: key)
            return loader
        }
    }
}

final class ImageLoader: ObservableObject {
    let path: String?
    
    var objectWillChange: AnyPublisher<UIImage?, Never> = Publishers.Sequence<[UIImage?], Never>(sequence: []).eraseToAnyPublisher()
    
    @Published var image: UIImage? = nil
    
    var cancellable: AnyCancellable?
        
    init(path: String?) {
        self.path = path
        
        self.objectWillChange = $image.handleEvents(receiveSubscription: { [weak self] sub in
            self?.loadImage()
        }, receiveCancel: { [weak self] in
            self?.cancellable?.cancel()
        }).eraseToAnyPublisher()
        
        loadImage()
    }
    
    func loadImage() {
        guard let path = path, image == nil else { return }
        
        cancellable = ImageService.shared.fetchImage(path: path)
            .receive(on: DispatchQueue.main)
            .assign(to: \ImageLoader.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
}
