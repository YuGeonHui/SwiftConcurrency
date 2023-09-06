//
//  GlobalActorView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/05.
//

import SwiftUI

struct GlobalActorView: View {
    
    @StateObject private var viewModel = GlobalActorViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                
                ForEach(viewModel.dataArray1, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await viewModel.getData()
        }
    }
}

struct GlobalActorView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalActorView()
    }
}
