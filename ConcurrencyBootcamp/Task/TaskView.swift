//
//  TaskView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/29.
//

import SwiftUI

struct TaskHomeView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                NavigationLink("Click Me") {
                    TaskView()
                }
            }
        }
    }
}


struct TaskView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        
        VStack(spacing: 40) {
            
            if let image = viewModel.image {
                
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            // 취소까지 보장을 해준다. 
            await viewModel.fetchImage()
        }
        .onAppear {
            Task {
                await viewModel.fetchImage()
                await viewModel.fetchImage2()
            }
            
//            Task(priority: .high) {
//                print("high: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .userInitiated) {
//                print("userInitiated: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .medium) {
//                print("medium: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .low) {
//                print("low: \(Thread.current) : \(Task.currentPriority)")
//            }
//            Task(priority: .utility) {
//                print("utility: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .background) {
//                print("background: \(Thread.current) : \(Task.currentPriority)")
//            }
            
            
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
