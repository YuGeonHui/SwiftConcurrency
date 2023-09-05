//
//  GlobalActorManager.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/05.
//

import Foundation

@globalActor final class GlobalActor {
    static var shared = GlobalActorManager()
}

actor GlobalActorManager {
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three", "Four", "Five", "Six"]
    }
}
