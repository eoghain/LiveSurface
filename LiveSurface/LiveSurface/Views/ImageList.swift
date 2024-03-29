//
//  ImageList.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct ImageList: View {
//    var images: [LSImage]
    var viewModel: ImagesViewModel
    var size: CGSize = CGSize(width: 400, height: 300)
    
    var body: some View {
        List(self.viewModel.images.images.map({ $1 })) { image in
            ImageCell(image: image, size: self.size)
        }
    }
}

struct ImageList_Previews: PreviewProvider {
    
    static var previews: some View {
        let images = [
            LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")),
            LSImage(index: 1, name: "two", number: "two", image: "two.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: ""))
        ]
        
        let viewModel = ImagesViewModel()
        viewModel.images = Images(images: ["one" : images[0], "two" : images[1]])
        
        return ImageList(viewModel: viewModel)
    }
}
