//
//  ContinuationViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/01.
//

import UIKit


class ContinuationViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    let networkManger = ContinuationNetworkManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/300") else { return }
        
        do {
            
            let data = try await networkManger.getData2(url: url)
//            let data = try await networkManger.getData(url: url)
            
            if let image = UIImage(data: data) {
                await MainActor.run(body: {
                    self.image = image
                })
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func getHeartImage() {
//
//        networkManger.getHeartImageFromDatabase { [weak self] image in
//
//            guard let self else { return }
//
//            self.image = image
//        }
//    }
    
    func getHeartImage() async {
        self.image = await networkManger.getHeartImageFromDatabase()
    }
}
