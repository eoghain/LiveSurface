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

    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
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
        }.fixedSize()
    }
}

struct LSImageView_Previews: PreviewProvider {
    static var previews: some View {
        LSImageView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/0661.jpg"))
    }
}
