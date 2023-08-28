//
//  DownloadImageAsyncView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/28.
//

import SwiftUI
import UIKit
import Combine

struct DownloadImageAsyncView: View {
    
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
    
    var body: some View {
        
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
        }
//        .onAppear { viewModel.fetchImage() }
        .task { await viewModel.fetchImageWithAsync() }
    }
}

struct DownloadImageAsyncView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsyncView()
    }
}
