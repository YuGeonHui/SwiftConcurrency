//
//  TaskGroupViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/31.
//

import UIKit

class TaskGroupViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    let manager = TaskGroupDataManger()
    
    func getImages() async {
        
//        if let images = try? await manager.fetchImageWithAsyncLet() {
//            self.images.append(contentsOf: images)
//        }
        
        if let images = try? await manager.fetchImagesWithTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}
