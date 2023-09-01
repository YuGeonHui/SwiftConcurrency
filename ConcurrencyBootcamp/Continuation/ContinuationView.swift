//
//  ContinuationView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/01.
//

import SwiftUI

struct ContinuationView: View {
    
    @StateObject private var viewModel = ContinuationViewModel()
    
    var body: some View {
        
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await viewModel.getImage()
            await viewModel.getHeartImage()
        }
    }
}

struct ContinuationView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationView()
    }
}
