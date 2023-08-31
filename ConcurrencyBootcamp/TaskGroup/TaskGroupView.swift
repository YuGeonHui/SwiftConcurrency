//
//  TaskGroupView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/31.
//

import SwiftUI

struct TaskGroupView: View {
    
    @StateObject private var viewModel = TaskGroupViewModel()
    let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVGrid(columns: colums) {
                    
                    ForEach(viewModel.images, id: \.self) { image in
                        
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Group")
            .task { await viewModel.getImages() }
        }
    }
}

struct TaskGroupView_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupView()
    }
}
