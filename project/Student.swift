//
//  Student.swift
//  project
//
//  Created by Shay Kremer on 13/11/2016.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import Foundation

class Student{
    var fName: String
    var lName: String
    let id : String
    var phoneNum : String?
    
    init(fN:String, lN:String,id:String) {
        self.fName = fN
        self.lName = lN
        self.id = id
    }
    
    init(fN:String, lN:String,id:String,pN:String?) {
        self.fName = fN
        self.lName = lN
        self.id = id
        if (pN != nil) {
            self.phoneNum = pN!
        }
    }
    
    init(st:Student) {
        self.fName = st.fName
        self.lName = st.lName
        self.id = st.id
        if (st.phoneNum != nil) {
            self.phoneNum = st.phoneNum!
        }
    }
    
    func printInfo() {
        print("st name is: \(fName)")
        
        print("st Lname is: \(lName)")
        
        print("st id is: \(id )")
        
        if (self.phoneNum != nil) {
            print("st phoneNum is: \(self.phoneNum!)")
        }
        else{
            print("no phone")
        }
    }
}
    
