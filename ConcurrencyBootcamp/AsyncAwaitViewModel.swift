//
//  AsyncAwaitViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/28.
//

import Foundation

final class AsyncAwaitViewModel: ObservableObject {
 
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dataArray.append("Title1: \(Thread.current)") // Main Thread
        }
    }
    
    func addTitle2() {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            
            let title = "Title2: \(Thread.current)"
            
            DispatchQueue.main.async {
                
                let title = "Title3: \(Thread.current)" // Main Thread
                self.dataArray.append(title)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dataArray.append("Title1: \(Thread.current)") // Main Thread
        }
    }
    
    func addAuthor() async {
        
        let author1 = "Author1: \(Thread.current)" // Main Thread
        self.dataArray.append(author1)
        
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let author2 = "Author2: \(Thread.current)" // Not Main Thread
        
        await MainActor.run {
            self.dataArray.append(author2)
            
            let author3 = "Author3: \(Thread.current)" // Main Thread
            self.dataArray.append(author3)
        }
    }
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let something1 = "Something1: \(Thread.current)"
        
        await MainActor.run {
            self.dataArray.append(something1)
            
            let something2 = "Something2: \(Thread.current)"
            self.dataArray.append(something2)
        }
    }
}
