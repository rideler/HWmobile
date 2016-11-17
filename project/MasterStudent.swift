//
//  MasterStudent.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 11/17/16.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import Foundation

class MasterStudent: Student {
    var mscDegree: NSString
    var thesis: NSString
    
    init(st1: Student ,msc: NSString, thesa: NSString) {
        self.mscDegree = msc
        self.thesis = thesa
        super.init(st: st1)
    }
    
    init(copySt: MasterStudent) {
        self.mscDegree = copySt.mscDegree
        self.thesis = copySt.thesis
        super.init(fN:copySt.fName, lN:copySt.lName,id:copySt.id,pN:copySt.phoneNum)
    }
    
    init(fN1:NSString, lN1:NSString,id1:NSString,pN1:NSString?, mscDegree:NSString, thesis:NSString){
        self.mscDegree = mscDegree
        self.thesis = thesis
        super.init(fN:fN1, lN:lN1,id:id1,pN:pN1)
    }
    
    override func printInfo() {
        super.printInfo()
        print("st mscDegree is: \(mscDegree)")
        print("st thesis is: \(thesis)")
    }
}
