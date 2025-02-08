//
//  MeasuringUnit.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//


import Foundation



public enum TypeErrors : Error , LocalizedError {
    case unmatchingUnits(String, String),unknownType(String)
    
    public var errorDescription:String? {
        switch self {
        case .unmatchingUnits(let first, let second):
            return "Unmatching units: \(first) and \(second)"
        case .unknownType(let name):
            
            return "Unknown type \(name), please add this type to supportedTypes array"
        }
    }
}

