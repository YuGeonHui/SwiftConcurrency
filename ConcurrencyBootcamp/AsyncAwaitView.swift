//
//  AsyncAwaitView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/28.
//

import SwiftUI

struct AsyncAwaitView: View {
    
    @StateObject private var viewModel = AsyncAwaitViewModel()
    
    var body: some View {
        
        ForEach(viewModel.dataArray, id: \.self) { data in
            Text(data)
        }
        .onAppear {
            viewModel.addTitle1()
            viewModel.addTitle2()
        }
        .task {
            await viewModel.addAuthor()
            await viewModel.addSomething()
            
            let finalText = "FINAL TEXT : \(Thread.current)"
            viewModel.dataArray.append(finalText)
        }
    }
}

struct AsyncAwaitView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitView()
    }
}
