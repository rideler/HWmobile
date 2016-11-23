//
//  PhdStudent.swift
//  project
//
//  Created by Shay Kremer Ron Naor on 11/17/16.
//  Copyright © 2016 Shay Kremer Ron Naor. All rights reserved.
//

import Foundation

class PhdStudent:  MasterStudent{
    var phdDegree: NSString
    var secThesis: NSString
    
    init(st2: MasterStudent ,phd: NSString, thesa: NSString) {
        self.phdDegree = phd
        self.secThesis = thesa
        super.init(copySt: st2)
    }

    init(copySt: PhdStudent) {
        self.phdDegree = copySt.phdDegree
        self.secThesis = copySt.secThesis
        super.init(fN1:copySt.fName, lN1:copySt.lName,id1:copySt.id,pN1:copySt.phoneNum, mscDegree:copySt.mscDegree, thesis:copySt.thesis)
    }
    
    override func printInfo() {
        super.printInfo()
        print("st phdDegree is: \(phdDegree)")
        print("st secThesis is: \(secThesis)")
    }
}
