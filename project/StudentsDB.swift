//
//  StudentsDB.swift
//  project
//
//  Created by Shay Kremer on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import Foundation

class StudentsDB {
    var students : [Student]
    
    init() {
        students = [Student]()
    }
    
    init(students:[Student]) {
        self.students = students
    }
    
    func printInfo(){
        if (students.count != 0) {
            for st in students{
                st.printInfo()
                print()
            }
        }
        else{
            print ("no students")
        }
    }
    
    func addStudent(st:Student){
        if (students.index(where: {$0.id == st.id}) == nil) {
            self.students.append(st)
        }
    }
    
    func addStudent(newfN:String, newlN:String,newid:String,newpN:String){
        if (students.index(where: {$0.id == newid}) == nil){
            let st:Student = Student(fN: newfN, lN: newlN, id: newid, pN: newpN)
            self.students.append(st)
        }
    }
    
    func addStudent(newfN:String, newlN:String,newid:String){
        if (students.index(where: {$0.id == newid}) == nil){
            let st:Student = Student(fN: newfN, lN: newlN, id: newid)
            self.students.append(st)
        }
    }
    
    func getStudent(sid:String) -> (Student?){
        if let found = students.filter({($0.id == sid)}).first {
            return found
        }
        else{
            return nil
        }
    }
    
    func deleteStudent(did:String) {
        self.students = students.filter({($0.id != did)})
    }
    
    func updateStudent(newSt:Student){
        if let i = students.index(where: {$0.id == newSt.id}){
            students[i] = newSt
        }
    }
}
