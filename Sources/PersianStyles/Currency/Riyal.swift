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
}
public extension OfflineUnit where Self == Riyal {
    static var rial : Riyal { .init() }
}
