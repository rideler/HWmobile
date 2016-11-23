//
//  StudentTest.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import XCTest

class StudentTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCtor(){
        let student1:Student = Student(fN:"Yan",lN:"Jhonas",id:"1234",pN:"4321")
        student1.printInfo()
        XCTAssert(student1.fName=="Yan" && student1.lName=="Jhonas" && student1.id=="1234" && student1.phoneNum=="4321")
        let student2:Student = Student(fN:"Yan",lN:"Jhonas",id:"1234")
        student2.printInfo()
        XCTAssert(student2.fName=="Yan" && student2.lName=="Jhonas" && student2.id=="1234" && student2.phoneNum == nil)
        let student3:Student = Student(st: student2)
        student3.printInfo()
        XCTAssert(student3.fName=="Yan" && student3.lName=="Jhonas" && student3.id=="1234" && student3.phoneNum == nil)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
