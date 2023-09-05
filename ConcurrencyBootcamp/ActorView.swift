//
//  ActorView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/04.
//

import SwiftUI

// 1. Actor는 어떤 문제를 해결 할 수 있는가 ?!
// 2. Actor 이전에는 이 문제를 어떻게 해결했나요?
// 3. Actor를 사용하여 문제 해결!

class MyDataManager {
    
    static let instance = MyDataManager()
    
    private init() {}
    
    var data: [String] = []
    private let lock = DispatchQueue(label: "com.MyApp.MyDataManger")
    
    func getRandomData(completionHandler: @escaping (_ title: String?) -> Void) {
        lock.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completionHandler(self.data.randomElement())
        }
    }
}

actor MyAcotrDataManager { // Thread safe!!!
    
    static let instance = MyAcotrDataManager()
    
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return self.data.randomElement()
    }
    
    nonisolated func getSavedData() -> String {
        return "NEW DATA"
    }
}

struct HomeView: View {
    
//    let manger = MyDataManager.instance
    
    let manger = MyAcotrDataManager.instance
    @State private var text: String = ""
    let time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
//        .onReceive(time) { _ in
//
//            DispatchQueue.global(qos: .background).async {
//
//                manger.getRandomData { title in
//
//                    if let data = title {
//                        DispatchQueue.main.async {
//                            self.text = data
//                        }
//                    }
//                }
//            }
//        }
        .task {
            let _ = manger.getSavedData
            let _ = await manger.data
        }
        .onReceive(time) { _ in
            Task {
                if let data = await manger.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
        }
    }
}

struct BrowseView: View {
    
    let manger = MyDataManager.instance
    @State private var text: String = ""
    let time = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(time) { _ in
            
            DispatchQueue.global(qos: .default).async {
                
                manger.getRandomData { title in
                    
                    if let data = title {
                        DispatchQueue.main.async {
                            self.text = data
                        }
                    }
                }
            }
        }
    }
}

struct ActorView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BrowseView()
                .tabItem {
                    Label("Brows", systemImage: "magnifyingglass")
                }
        }
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorView()
    }
}
