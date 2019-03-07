//
//  SwinjectInitAssembler.swift
//  Weather
//
//  Created by Tracker on 07.03.2019.
//  Copyright © 2019 Tracker. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import ObjectiveC.runtime

@objc protocol SwinjectInitAssembler {
    init()
}

var assembler: Assembler = commonAssembler()

fileprivate func objc_getClassList() -> [AnyClass] {
    let expectedClassCount = objc_getClassList(nil, 0)
    let allClasses = UnsafeMutablePointer<AnyClass?>.allocate(capacity:Int(expectedClassCount))
    let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
    let actualClassCount:Int32 = objc_getClassList(autoreleasingAllClasses, expectedClassCount)
    
    var classes = [AnyClass]()
    for i in 0 ..< actualClassCount {
        if let currentClass: AnyClass = allClasses[Int(i)] {
            if checkIfClassIsInitialAssembly(assemblyClass: currentClass) {
                classes.append(currentClass)
            }
        }
    }
    allClasses.deallocate()
    //allClasses.deallocate(capacity:Int(expectedClassCount))
    
    return classes
}

fileprivate func checkIfClassIsInitialAssembly(assemblyClass:AnyClass) -> Bool {
    return class_conformsToProtocol(assemblyClass, SwinjectInitAssembler.self)
}

fileprivate func commonAssembler() -> Assembler {
    
    var arrayAssembly = [Assembly]()
    
    let classes = objc_getClassList()
    
    for oneClass in classes {
        let object = (oneClass as! SwinjectInitAssembler.Type).init()
        arrayAssembly.append(object as! Assembly)
    }
    
    return Assembler(arrayAssembly)
}

