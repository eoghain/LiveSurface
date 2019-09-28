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
    @State var sliderValue = 400.0
    var minimumValue = 400.0
    var maximumValue = 1024.0
    
    var body: some View {
        VStack {
            Text("Images")
                .font(.largeTitle)
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Image Width: \(Int(sliderValue))")
                    Slider(value: $sliderValue, in: minimumValue...maximumValue, step: 1)
                }
                .padding()
                .frame(width: 300)
            }
            .opacity(self.viewModel.images.images.count == 0 ? 0 : 1)
            
            ZStack(alignment: .center) {
                ImageList(images: self.viewModel.images.images.map({ $1 }), size: CGSize(width: sliderValue, height: sliderValue * 0.75))
                    .opacity(self.viewModel.images.images.count == 0 ? 0 : 1)
                Text("Loading...")
                    .font(.largeTitle)
                    .animation(.easeInOut(duration: 0.75))
                    .opacity(self.viewModel.images.images.count == 0 ? 1 : 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ImagesViewModel())
    }
}
