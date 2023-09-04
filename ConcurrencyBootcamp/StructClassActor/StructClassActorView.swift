//
//  StructClassActorView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/04.
//

import SwiftUI

// https://medium.com/@vinayakkini/swift-basics-struct-vs-class-31b44ade28ae
// https://stackoverflow.com/questions/24217586/structure-vs-class-in-swift-language/59219141#59219141

/*

 VALUE TYPES:
 - Strcut, Enum, String, Int, etc..
 - Stored in the Stack
 - Faster
 - Thread safe
 - When you assign or pass value type a new copy of data is created
 
 REFERENCE TYPES:
 - Class, Function, Actor
 - Stored in Heap
 - Slower, but synchronized
 - NOT Thread safe
 - When you assign or pass reference a new reference to original instance will be created (pointer)
 
 STACK:
 - Stored Value types
 - Variables allocated on the stack are stored directly to the memory, and access to this memory is very fast
 - Each thread has it's own stack!
 
 HEAP:
 - Stored Reference types
 - Shared across threads!

 STRUCT:
 - Based on VALUES
 - Can me mutated
 - Stored in the stack!
 
 CALSS:
 - Based on REFERENCE (INSTANCES)
 - Stored in the Heap!
 - Inherit from other classes
 
 ACTORS:
 - Same as Class, but thread safe!
 
 
 Structs: Data Model, Views
 Classes: ViewModels
 Actors: Shared 'Manger' and 'Data Store'
 
 
*/

actor StructClassActorDataManer {
    
    func getDataFromDatabase() {
        
    }
}

class StructClassActorViewModel: ObservableObject {
    
    @Published var title: String = ""
    
    init() {
        print("VIEWMODEL INIT")
    }
}

struct StructClassActorView: View { // 구조체로 생성을 하면 빠르게 생성이 가능하다.
    
    @StateObject private var viewModel = StructClassActorViewModel()
    let isActive: Bool
    
    init(isActive: Bool) {
        self.isActive = isActive
        
        print("VIEW INIT")
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .background(isActive ? Color.red : Color.blue)
            .onAppear {
//                runTest()
            }
    }
}

struct StructClassActorHomeView: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        StructClassActorView(isActive: isActive)
            .onTapGesture { isActive.toggle() }
    }
}

extension StructClassActorView {
    private func runTest() {
        structTest1()
        printDivider()
        classTest1()
        printDivider()
        actorTest1()
        
//        structTest2()
//        printDivider()
//        classTest2()
    }
    
    private func printDivider() {
        print("""
        ---------------------------------------
        """)
    }
    
    private func structTest1() {
        
        print(#function)
        
        let objectA = MyStruct(title: "Starting title!!")
        print("ObjectA: ", objectA.title) // Starting title!!
        
        print("Pass the VALUES of objectA to obejctB")
        
        var objectB = objectA // 값을 그대로 복사해서 사용한다.
        print("ObjectB: ", objectB.title) // Starting title!!
        
        print("ObjectB title changed.")
        
        objectB.title = "Second title!!"
        print("ObjectA: ", objectA.title) // Starting title!!
        print("ObjectB: ", objectB.title) // Second title!!
    }
    
    private func classTest1() {
        
        print(#function)
        
        let objectA = MyClass(title: "Starting title!!")
        print("ObjectA: ", objectA.title) // Starting title!!
        
        print("Pass the REFERENCE of objectA to obejctB")
        let objectB = objectA // 영역의 주소가 불변 (let)
        print("ObjectB: ", objectB.title) // Starting title!!
        
        print("ObjectB title changed.")
        
        objectB.title = "Second title!!"
        print("ObjectA: ", objectA.title) // Second title!!
        print("ObjectB: ", objectB.title) // Second title!!
    }
    
    private func actorTest1() { // Thread Safe
        
        print(#function)
        
        Task {
            
            let objectA = MyActor(title: "Starting title!!")
            await print("ObjectA: ", objectA.title) // Starting title!!
            
            print("Pass the REFERENCE of objectA to obejctB")
            let objectB = objectA
            await print("ObjectB: ", objectB.title) // Starting title!!
            
            print("ObjectB title changed.")
            
            await objectB.updateTitle(newTitle: "Second title!")
            await print("ObjectA: ", objectA.title) // Second title!!
            await print("ObjectB: ", objectB.title) // Second title!!
        }
    }
}

extension StructClassActorView {
    
    private func structTest2() {
        print(#function)
        
        var struct1 = MyStruct(title: "Title1")
        print("Struct1: ", struct1.title) // Title1
        struct1.title = "Title2"
        print("Struct1: ", struct1.title) // Title2
        
        var struct2 = MyCustomStruct(title: "Title1")
        print("Struct2: ", struct2.title) // Title1
        struct2 = MyCustomStruct(title: "Title2")
        print("Struct2: ", struct2.title) // Title2
        
        var struct3 = MyCustomStruct(title: "Title1")
        print("Struct3: ", struct3.title) // Title1
        struct3 = struct3.updateTitle(newTitle: "Title2")
        print("Struct3: ", struct2.title) // Title2
        
        var struct4 = MyMutatingStruct(title: "Title1")
        print("Struct4: ", struct4.title) // Title1
        struct4.updateTitle(newTitle: "Title2")
        print("Struct4: ", struct4.title) // Title2
    }
    
    private func classTest2() {
        
        print(#function)
        
        let class1 = MyClass(title: "Title1")
        print("Class1: ", class1.title) // Title1
        class1.title = "Title2"
        print("Class1: ", class1.title) // Title2
        
        let class2 = MyClass(title: "Title1")
        print("Class2: ", class2.title) // Title1
        class2.updateTitle(newTitle: "Title2")
        print("Class2: ", class2.title) // Title2
    }
}

struct StructClassActorView_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorView(isActive: true)
    }
}
