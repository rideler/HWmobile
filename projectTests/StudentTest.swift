//
//  StudentTest.swift
//  project
//
//  Created by Shay Kremer on 13/11/2016.
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
    
    func testExample() {
        //building student
        var student:Student = Student(fN:"Yan",lN:"Jhonas",id:"1234",pN:"4321")
        print("before")
        student.printInfo()
        //changing the student values
        student.fName = "Fchange"
        student.lName = "Lchange"
        //student.id = "idChange" -not possible because of const
        student.phoneNum = nil
        print("after")
        //should see print of phone number with  message "no phone"
        student.printInfo()
        //building student with no phone number
        student = Student(fN:"1Yan",lN:"1Jhonas",id:"11234")
        student.printInfo()
        //adding phone number
        student.phoneNum = "8888"
        student.printInfo()
        //using copy CTR
        let st:Student = Student(st: student)
        st.printInfo()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
