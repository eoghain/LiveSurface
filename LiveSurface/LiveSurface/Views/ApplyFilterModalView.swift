//
//  ApplyFilterModalView.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/28/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI

struct ApplyFilterModalView: View {
    @ObservedObject var imageLoader: ImageLoader
    @Environment(\.presentationMode) var presentationMode
    @State var image: LSImage
    @State private var filter: FilterType?
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss")
            }.padding(.bottom, 30)
            LSImageView(imageLoader: self.imageLoader, image: self.image, filter: self.filter)
            
            HStack {
                Button(
                    action: { self.applyFilter(filter: .none)},
                    label: { Text("None") }
                )
                Button(
                    action: { self.applyFilter(filter: .chrome)},
                    label: { Text("Chrome") }
                )
                Button(
                    action: { self.applyFilter(filter: .fade) },
                    label: { Text("Fade") }
                )
                Button(
                    action: { self.applyFilter(filter: .instant) },
                    label: { Text("Instant") }
                )
                Button(
                    action: { self.applyFilter(filter: .mono) },
                    label: { Text("Mono") }
                )
                Button(
                    action: { self.applyFilter(filter: .noir) },
                    label: { Text("Noir") }
                )
                Button(
                    action: { self.applyFilter(filter: .process) },
                    label: { Text("Process") }
                )
                Button(
                    action: { self.applyFilter(filter: .tonal) },
                    label: { Text("Tonal") }
                )
                Button(
                    action: { self.applyFilter(filter: .transfer) },
                    label: { Text("Transfer") }
                )
            }.padding(.bottom, 30)
        }
        .padding()
    }
    
    func applyFilter(filter filterType: FilterType) {
        filter = filterType
    }
}

struct ApplyFilterModalView_Previews: PreviewProvider {
    static var previews: some View {
        ApplyFilterModalView(imageLoader: ImageLoaderCache.shared.loaderFor(path: "https://www.livesurface.com/test/images/0661.jpg"), image: LSImage(index: 0, name: "one", number: "one", image: "one.jpg", category: "category", version: "version", tags: Tags(sizedescription: "", sizescale: "", sizewidth: "", sizewidtharc: "", sizeheight: "", sizeheightarc: "", sizedepth: "", sizedeptharc: "", sizeunits: "")))
    }
}
