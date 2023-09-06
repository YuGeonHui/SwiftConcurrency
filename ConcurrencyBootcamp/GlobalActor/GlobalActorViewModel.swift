//
//  GlobalActorViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/05.
//

import Foundation

@MainActor // 메인 스레드에서의 동작을 보장시켜준다.
class GlobalActorViewModel: ObservableObject {
    
    @Published var dataArray1: [String] = []
    @Published var dataArray2: [String] = []
    @Published var dataArray3: [String] = []
    let manager = GlobalActor.shared
    
    @GlobalActor
    func getData() {
        
        // HEAVY COMPLEX METHODS
        
        Task {
            let data = await manager.getDataFromDatabase()
            await MainActor.run(body: {
                self.dataArray1 = data
            })
        }
    }
}
