//
//  StudentsDB.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import Foundation

class StudentsDB {
    static let instance = StudentsDB()
    var students = [Student]()
    
    private init() {}
    
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
    
    func addStudent(newfN:NSString, newlN:NSString,newid:NSString,newpN:NSString){
        if (students.index(where: {$0.id == newid}) == nil){
            let st:Student = Student(fN: newfN, lN: newlN, id: newid, pN: newpN)
            self.students.append(st)
        }
    }
    
    func addStudent(newfN:NSString, newlN:NSString,newid:NSString){
        if (students.index(where: {$0.id == newid}) == nil){
            let st:Student = Student(fN: newfN, lN: newlN, id: newid)
            self.students.append(st)
        }
    }
    
    func getStudent(sid:NSString) -> (Student?){
        if let found = students.filter({($0.id == sid)}).first {
            return found
        }
        else{
            return nil
        }
    }
    
    func deleteStudent(did:NSString) {
        self.students = students.filter({($0.id != did)})
    }
    
    func updateStudent(newSt:Student){
        if let i = students.index(where: {$0.id == newSt.id}){
            students[i] = newSt
        }
    }
}
