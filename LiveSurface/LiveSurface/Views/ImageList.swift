//
//  ImageList.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct ImageList: View {
    var images: [Image]
    
    var body: some View {
        List(self.images) { image in
            ImageCell(image: image)
        }
    }
}

struct ImageList_Previews: PreviewProvider {
    
    static var previews: some View {
        let images = [
            Image(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")),
            Image(index: 1, name: "two", number: "two", image: "two.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: ""))
        ]
        
        return ImageList(images: images)
    }
}
