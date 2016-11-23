//
//  StudentsDBtest.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import XCTest

class StudentsDBtest: XCTestCase {
    var list:StudentsDB!
    
    override func setUp() {
        super.setUp()
        //building empty DB
        
        self.list = StudentsDB.instance
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        //adding student by 3 valus
        
        self.list.addStudent(st:Student( fN:"first", lN: "last", id: "282678", pN: "678167678"))
        self.list.addStudent(st: MasterStudent(st1: Student(fN:"sec",lN:"secLast",id:"1234",pN:"43214321"), msc: "computer", thesa: "mobile" ))
        self.list.addStudent(st: PhdStudent(st2: MasterStudent(st1: Student(fN:"phd",lN:"phdLast",id:"2345",pN:"54534443"), msc: "computer", thesa: "mobile" ), phd: "cyber", thesa: "sql"))
        //check first degree student add
        XCTAssert(self.list.students[0].fName == "first" && self.list.students[0].lName == "last" && self.list.students[0].id == "282678" && self.list.students[0].phoneNum == "678167678")
        //check master degree student add
        XCTAssert(self.list.students[1].fName == "sec" && self.list.students[1].lName == "secLast" && self.list.students[1].id == "1234" && self.list.students[1].phoneNum == "43214321" && (self.list.students[1] as! MasterStudent).mscDegree == "computer" && (self.list.students[1] as! MasterStudent).thesis == "mobile")
        //check phd degree student add
        XCTAssert(self.list.students[2].fName == "phd" && self.list.students[2].lName == "phdLast" && self.list.students[2].id == "2345" && self.list.students[2].phoneNum == "54534443" && (self.list.students[2] as! PhdStudent).mscDegree == "computer" && (self.list.students[2] as! PhdStudent).thesis == "mobile" && (self.list.students[2] as! PhdStudent).phdDegree == "cyber" && (self.list.students[2] as! PhdStudent).secThesis == "sql")
        self.list.printInfo()
    }
    
    func testGet() {
        //checking that the list got values
        if (self.list.students.count == 0){
            testAdd()
        }
        //getting nil with none exisiting id
        var student:Student? = self.list.getStudent(sid: "no")
        XCTAssert(student == nil)
        //getting first degree student
        student = self.list.getStudent(sid: "282678")
        XCTAssert(student?.fName == "first" && student?.lName == "last" && student?.id == "282678" && student?.phoneNum == "678167678")
        //getting master degree student
        student = self.list.getStudent(sid: "1234")
        XCTAssert(student?.fName == "sec" && student?.lName == "secLast" && student?.id == "1234" && student?.phoneNum == "43214321" && (student as! MasterStudent).mscDegree == "computer" && (student as! MasterStudent).thesis == "mobile")
        //getting phd degree student
        student = self.list.getStudent(sid: "2345")
        XCTAssert(student?.fName == "phd" && student?.lName == "phdLast" && student?.id == "2345" && student?.phoneNum == "54534443" && (student as! PhdStudent).mscDegree == "computer" && (student as! PhdStudent).thesis == "mobile" && (student as! PhdStudent).phdDegree == "cyber" && (student as! PhdStudent).secThesis == "sql")
    }
    
    func testDelete(){
        
        //checking that the list got values
        if (self.list.students.count == 0){
            testAdd()
        }
        //checking with no exisiting id
        self.list.deleteStudent(did: "none")
        var count = self.list.students.count
        XCTAssert(count == 3)
        //deleting first degree student
        self.list.deleteStudent(did: "282678")
        count = self.list.students.count
        XCTAssert(count == 2)
        //deleting master degree student
        self.list.deleteStudent(did: "1234")
        count = self.list.students.count
        XCTAssert(count == 1)
        //deleting phd degree student
        self.list.deleteStudent(did: "2345")
        count = self.list.students.count
        XCTAssert(count == 0)
    }
    
    func testUpdate(){
        //checking that the list got values
        if (self.list.students.count == 0){
            testAdd()
        }
        //updating first degree all values change
        self.list.updateStudent(newSt: Student(fN:"change1",lN:"change2",id:"282678",pN:"change3"))
        XCTAssert(self.list.students[0].fName == "change1" && self.list.students[0].lName == "change2" && self.list.students[0].id == "282678" && self.list.students[0].phoneNum == "change3")
        //updating master degree all values change
        self.list.updateStudent(newSt: MasterStudent(st1: Student(fN:"change4",lN:"change5",id:"1234",pN:"change6"), msc: "change7", thesa: "change8" ))
        XCTAssert(self.list.students[1].fName == "change4" && self.list.students[1].lName == "change5" && self.list.students[1].id == "1234" && self.list.students[1].phoneNum == "change6" && (self.list.students[1] as! MasterStudent).mscDegree == "change7" && (self.list.students[1] as! MasterStudent).thesis == "change8")
        //updating phd degree all values change
        self.list.updateStudent(newSt: PhdStudent(st2: MasterStudent(st1: Student(fN:"change9",lN:"change10",id:"2345",pN:"change11"), msc: "change12", thesa: "change13" ), phd: "change14", thesa: "change15"))
        XCTAssert(self.list.students[2].fName == "change9" && self.list.students[2].lName == "change10" && self.list.students[2].id == "2345" && self.list.students[2].phoneNum == "change11" && (self.list.students[2] as! PhdStudent).mscDegree == "change12" && (self.list.students[2] as! PhdStudent).thesis == "change13" && (self.list.students[2] as! PhdStudent).phdDegree == "change14" && (self.list.students[2] as! PhdStudent).secThesis == "change15")
        //updating first degree to master degree
        self.list.updateStudent(newSt: MasterStudent(st1: Student(fN:"change4",lN:"change5",id:"282678",pN:"change6"), msc: "change7", thesa: "change8" ))
        XCTAssert(self.list.students[0].fName == "change4" && self.list.students[0].lName == "change5" && self.list.students[0].id == "282678" && self.list.students[0].phoneNum == "change6" && (self.list.students[0] as! MasterStudent).mscDegree == "change7" && (self.list.students[0] as! MasterStudent).thesis == "change8")
        //updating master degree to phd degree
        self.list.updateStudent(newSt: PhdStudent(st2: MasterStudent(st1: Student(fN:"change9",lN:"change10",id:"282678",pN:"change11"), msc: "change12", thesa: "change13" ), phd: "change14", thesa: "change15"))
        XCTAssert(self.list.students[0].fName == "change9" && self.list.students[0].lName == "change10" && self.list.students[0].id == "282678" && self.list.students[0].phoneNum == "change11" && (self.list.students[0] as! PhdStudent).mscDegree == "change12" && (self.list.students[0] as! PhdStudent).thesis == "change13" && (self.list.students[0] as! PhdStudent).phdDegree == "change14" && (self.list.students[2] as! PhdStudent).secThesis == "change15")
        //deleting all values so it won't effect future tests
        testDelete()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
