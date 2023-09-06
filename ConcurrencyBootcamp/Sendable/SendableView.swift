//
//  SendableView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/06.
//

import SwiftUI

// Sendable = safe to share
// concurrency 상황(Code)에서 안전하게 공유될 수 있는 타입

// actor는 shared mutable state에 대한 접근을 동기화하기 때문에
// Concurrent code에서 data race를 피할 수 있었습니다.


struct SendableView: View {
    
    @StateObject private var viewModel = SendableViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                
            }
    }
}

struct SendableView_Previews: PreviewProvider {
    static var previews: some View {
        SendableView()
    }
}
