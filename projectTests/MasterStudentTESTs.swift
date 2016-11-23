//
//  MasterStudentTESTs.swift
//  project
//
//  Created by Shay Kremer on 11/17/16.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import XCTest

class MasterStudentTESTs: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCtor() {
        let student:Student = Student(fN:"Yan",lN:"Jhonas",id:"1234",pN:"4321")
        let master = MasterStudent(st1: student, msc: "computer", thesa: "mobile")
        XCTAssert(master.fName == "Yan" && master.lName == "Jhonas" && master.id == "1234" && master.phoneNum == "4321" && master.mscDegree == "computer" && master.thesis == "mobile")
        master.printInfo()
        
        let master2 = MasterStudent(copySt: master)
        XCTAssert(master2.fName == "Yan" && master2.lName == "Jhonas" && master2.id == "1234" && master2.phoneNum == "4321" && master2.mscDegree == "computer" && master2.thesis == "mobile")
        master2.printInfo()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
