//
//  SendableViewModel.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/06.
//

import Foundation

class SendableViewModel: ObservableObject {
    
    let manager = SendableActor()
    
    func updateCurrentUserInfo() async {
        
        let info = MyUseInfo(name: "info")
        
        await self.manager.updateDatabase(userInfo: info)
    }
}
