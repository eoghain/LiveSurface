//
//  ImageCell.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct ImageCell: View {
    var image: LSImage
    var size: CGSize = CGSize(width: 400, height: 300)
    
    var body: some View {
        VStack {
            LSImageView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/\(image.image)"))
                .aspectRatio(0.75, contentMode: .fit)
                .frame(width: size.width, height: size.height)
            ImageMetadataView(image: image)
        }
        .animation(.default)
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageCell(image: LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")))
            ImageCell(image: LSImage(index: 1, name: "two", number: "two", image: "two.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")))
        }
    }
}
