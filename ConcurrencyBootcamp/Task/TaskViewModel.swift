//
//  TaskViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/29.
//

import UIKit
import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async {
        
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        
        do {
            
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image = UIImage(data: data)
                print("Image Downlaod Success")
            })
            
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        
        do {
            
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
            })
           
        } catch {
            
            print(error.localizedDescription)
        }
    }
}
