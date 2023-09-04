//
//  MyActor.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/04.
//

import Foundation

actor MyActor {
    var title: String
     
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(newTitle: String) {
        self.title = newTitle
    }
}
