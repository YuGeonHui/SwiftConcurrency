//
//  StructClassActorView.swift
//  ConcurrencyBootcamp
//
//  Created by geonhui Yu on 2023/09/04.
//

import SwiftUI

struct StructClassActorView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                runTest()
            }
    }
}

extension StructClassActorView {
    private func runTest() {
        structTest1()
        printDivider()
        classTest1()
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
        
    }
}

struct StructClassActorView_Previews: PreviewProvider {
    static var previews: some View {
        StructClassActorView()
    }
}
