//
//  DateOperator.swift
//  PersianStyles
//
//  Created by Mohammad Ne on 7/3/26.
//
import Foundation

infix operator ~=

public extension Date {
    
    static func ~=(lhs : Date , rhs : Date) -> Bool {
        let calendar = persianCalander
        
        return calendar.isDate(lhs, equalTo: rhs, toGranularity: .second)
    }
    
}
