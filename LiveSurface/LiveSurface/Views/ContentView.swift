//
//  ContentView.swift
//  LiveSurface
//
//  Created by Rob Booth on 9/27/19.
//  Copyright © 2019 Rob Booth. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel = ImagesViewModel()
    
    var body: some View {
        ZStack(alignment: .center) {
            ImageList(images: self.viewModel.images.images.map({ $1 }))
                .opacity(self.viewModel.images.images.count == 0 ? 0 : 1)
            Text("Loading...")
                .opacity(self.viewModel.images.images.count == 0 ? 1 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ImagesViewModel())
    }
}
