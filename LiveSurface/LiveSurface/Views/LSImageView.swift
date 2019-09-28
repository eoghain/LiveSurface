//
//  LSImageView.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct LSImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    var image: LSImage
    var filter: FilterType?

    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: applyFilter(image: self.imageLoader.image!, filter: self.filter))
                    .resizable()
                    .renderingMode(.original)
                    .animation(.default)
            } else {
                Image("Placeholder")
                .resizable()
                .renderingMode(.original)
                .animation(.default)
            }
            }.onAppear {
                self.imageLoader.loadImage()
        }
    }
    
    func applyFilter(image: UIImage, filter filterType: FilterType?) -> UIImage {
        guard let filterType = filterType else { return image }
        guard filterType != .none else { return image }
        guard let filter = CIFilter(name: filterType.rawValue) else { return image }
        
        let ciContext = CIContext()
        let ciInput = CIImage(image: image)
        
        filter.setValue(ciInput, forKey: "inputImage")
        
        guard let ciOutput = filter.outputImage else { return image }
        guard let cgImage = ciContext.createCGImage(ciOutput, from: ciOutput.extent) else { return image }
        
        return UIImage(cgImage: cgImage)
    }
}

struct LSImageView_Previews: PreviewProvider {
    static var previews: some View {
        LSImageView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/0661.jpg"), image: LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")))
    }
}
