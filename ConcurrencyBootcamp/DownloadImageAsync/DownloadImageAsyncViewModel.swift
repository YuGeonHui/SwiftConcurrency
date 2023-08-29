//
//  DownloadImageAsyncViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/08/28.
//

import UIKit
import Combine

class DownloadImageAsyncViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let loader = DownloadImageAsyncImageLoader()
    var cancellables = Set<AnyCancellable>()
    
    func fetchImage() {
        
//        loader.downloadWithEscaping { [weak self] image, error in
//            DispatchQueue.main.async {
//                self?.image = image
//            }
//        }
        
//        loader.downloadWithCombine()
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//
//            } receiveValue: { image in
//                self.image = image
//            }
//            .store(in: &cancellables)
    }
    
    func fetchImageWithAsync() async {
        
        let image = try? await loader.downloadWithAsync()
        await MainActor.run {
            self.image = image
        }
    }
}
