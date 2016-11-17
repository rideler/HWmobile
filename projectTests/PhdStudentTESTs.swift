//
//  PhdStudentTESTs.swift
//  project
//
//  Created by Shay Kremer on 11/17/16.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import XCTest

class PhdStudentTESTs: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let student:Student = Student(fN:"Yan",lN:"Jhonas",id:"1234",pN:"4321")
        let master = MasterStudent(st1: student, msc: "computer", thesa: "mobile")
        let phd = PhdStudent(st2: master, phd: "cyber", thesa: "sql")
        print("should be YAN,Jhonas,1234,4321,computer,mobile,cyber, sql")
        phd.printInfo()
        
        let phd2 = PhdStudent(copySt: phd)
        print("should be YAN,Jhonas,1234,4321,computer,mobile,cyber, sql")
        phd2.printInfo()
        
        XCTAssert(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
