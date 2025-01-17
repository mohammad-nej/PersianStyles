//
//  Riyal.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public struct Riyal : Sendable,OfflineUnit {
    
    fileprivate init() {
        
    }
    public typealias TypeUnit = Currency
   
    public typealias CalcType = Offline
    
    public static let shortSymbol: String = "ریال"
    
    public static let longSymbol: String = "ریال"
    
    public typealias Referance = Self
    
    ///Convert Rial to Rial
    public static func convertToReferance(_ amount: Double)  -> Double {
        logger.warning("Riyal is a reference currency, converting to/from it has no effect", byPass: true)
        return amount
    }
    
    ///Convert Rial to Rial
    public static func convertFromReferance(_ amount: Double)  -> Double {
        logger.warning("Riyal is a reference currency, converting to/from it has no effect", byPass: true)
        return amount
    }

}
public extension OfflineUnit where Self == Riyal {
    static var rial : Riyal { .init() }
}
