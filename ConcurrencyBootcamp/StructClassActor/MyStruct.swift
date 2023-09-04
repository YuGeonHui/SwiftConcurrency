//
//  MyStruct.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/04.
//

import Foundation

struct MyStruct {
    var title: String
}

struct MyCustomStruct {
    let title: String
    
    func updateTitle(newTitle: String) -> Self {
        MyCustomStruct(title: newTitle)
    }
}

struct MyMutatingStruct {
    
    private(set) var title: String
    
    init(title: String) {
        self.title = title
    }
    
    mutating func updateTitle(newTitle: String) {
        title = newTitle
    }
}
