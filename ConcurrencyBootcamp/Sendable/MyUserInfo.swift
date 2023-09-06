//
//  MyUserInfo.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/06.
//

import Foundation

// Sendable을 채택할 수 있는 타입
// 1) VALUE TYPES
// 2) ACTOR
// 3) final class
// 4) Main Actor로 마킹된 Class
// 5) @Sendable로 마킹된 클로저, 함수
// 6) Meta Type

struct MyUseInfo: Sendable {
    
    let name: String
}

// @unchecked Sendable: 내가 sendalbe 인지를 직접 체크하겠다.
final class MyClassUserInfo: @unchecked Sendable {
    
    private var name: String
    let queue = DispatchQueue(label: "com.MyApp.MyClassUserInfo")
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(name: String) {
        queue.async {
            self.name = name
        }
    }
}
