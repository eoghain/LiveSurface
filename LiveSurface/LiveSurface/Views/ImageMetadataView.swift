//
//  ImageMetadataView.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct ImageMetadataView: View {
    var image: LSImage
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading) {
                KeyValueView(key: "Name:", value: image.name)
                KeyValueView(key: "Number:", value: image.number)
                KeyValueView(key: "Image:", value: image.image)
                KeyValueView(key: "Category:", value: image.category)
                KeyValueView(key: "Version:", value: image.version)
            }
            
            VStack(alignment: .leading) {
                Text("Tags:")
                    .underline(true, color: .black)
                KeyValueView(key: "Description:", value: image.tags.sizedescription)
                KeyValueView(key: "Scale:", value: image.tags.sizescale)
                KeyValueView(key: "Width:", value: image.tags.sizewidth)
                KeyValueView(key: "Widtharc:", value: image.tags.sizewidtharc)
                KeyValueView(key: "Height:", value: image.tags.sizeheight)
                KeyValueView(key: "Heightarc:", value: image.tags.sizeheightarc)
                KeyValueView(key: "Depth:", value: image.tags.sizedepth)
                KeyValueView(key: "Deptharc:", value: image.tags.sizedeptharc)
                KeyValueView(key: "Units:", value: image.tags.sizeunits)
            }
        }
        .padding()
        .border(Color.black, width: 1)
    }
}

struct KeyValueView: View {
    var key: String
    var value: String
    
    var body: some View {
        HStack {
            Text(key)
            Text(value)
        }
    }
}

struct ImageMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMetadataView(image: LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "A7", sizescale: "0.000", sizewidth: "7.25", sizewidtharc: "0", sizeheight: "5.250", sizeheightarc: "0", sizedepth: "0.000", sizedeptharc: "0", sizeunits: "in")))
    }
}
