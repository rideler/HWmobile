//
//  StudentsDBtest.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import XCTest

class StudentsDBtest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        //building empty DB
        
        let list = StudentsDB.instance
        
        list.printInfo()
        
        //adding student by 4 valus
        
        list.addStudent(newfN: "first", newlN: "last", newid: "282678", newpN: "678167678")
        
        //adding student by 3 valus
        
        list.addStudent(newfN: "first2", newlN: "last2", newid: "28268")
        
        //adding student
        
        let newST:Student = Student(fN: "1", lN: "2", id: "2727")
        
        list.addStudent(st: newST)
        
        list.printInfo()
        
        print("**************")
        
        //checking if possible to add 2 students with the same id
        
        list.addStudent(newfN: "you", newlN: "yo", newid: "2727")
        
        list.printInfo()
        
        print("**************")
        
        //checking the get student func
        
        list.getStudent(sid: "2727")?.printInfo()
        
        list.getStudent(sid: "no")?.printInfo()
        
        //checking the delete
        
        list.deleteStudent(did: "28268")
        
        list.printInfo()
        
        print("**************")
        
        list.deleteStudent(did: "no")
        
        list.printInfo()
        
        print("**************")
        
        //checking the update
        
        let update:Student = Student(fN: "9", lN: "8", id: "2727")
        
        list.updateStudent(newSt: update)
        
        list.printInfo()
        
        print("**************")
        
        let noUpdate:Student = Student(fN: "5", lN: "6", id: "no")
        
        list.updateStudent(newSt: noUpdate)
        
        list.printInfo()
        
        print("**************")
        
        let newST1:Student = Student(fN: "1", lN: "2", id: "999")
        
        let master = MasterStudent(st1: newST1, msc: "computer", thesa: "mobile")
        
        list.addStudent(st: master)
        
        list.printInfo()
        
        print("**************")
        
        let newST2:Student = Student(fN: "1", lN: "2", id: "666")
        
        let master1 = MasterStudent(st1: newST2, msc: "computer", thesa: "mobile")
        
        let phd = PhdStudent(st2: master1, phd: "cyber", thesa: "sql")
        
        list.addStudent(st: phd)
        
        list.printInfo()
        
        print("**************")
        
        list.deleteStudent(did: "666")
        
        list.printInfo()
        
        print("*******")
        
        list.deleteStudent(did: "999")
        
        list.printInfo()
        
        print("**************")
        
        let master2 = MasterStudent(st1: newST, msc: "computer", thesa: "mobile")
        
        let phd1 = PhdStudent(st2: master2, phd: "cyber", thesa: "sql")
        
        list.updateStudent(newSt: master2)
        
        list.printInfo()
        
        print("*******")
        
        list.updateStudent(newSt: phd1)
        
        list.printInfo()
        
        print("**************")
        
        list.getStudent(sid: "2727")?.printInfo()
        
        
        
        
        
        XCTAssert(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
