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
    @State private var show_modal: Bool = false
    
    var body: some View {
        VStack{
            LSImageView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/\(image.image)"), image: self.image)
                .aspectRatio(0.75, contentMode: .fit)
                .frame(width: size.width, height: size.height)
            ImageMetadataView(image: image)
        }
        .animation(.default)
        .gesture(TapGesture()
            .onEnded { _ in
                self.show_modal = true
            }
        ).sheet(isPresented: self.$show_modal) {
            ApplyFilterModalView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/\(self.image.image)"), image: self.image)
        }
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(image: LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")))
    }
}
