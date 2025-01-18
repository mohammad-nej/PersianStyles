//
//  Meter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import Foundation
public struct Meter : OfflineUnit {
    
    public static let id: UUID = UUID()
    
    public init(){
        
    }
    
    public   func convertToReferance(_ amount: Double) -> Double {
        return amount * 100
    }
    
    public   func convertFromReferance(_ amount: Double) -> Double {
        return amount / 100
    }
    
    public typealias TypeUnit = Lenght
    
    
    
    public   let shortSymbol: String = "m"
    
    public   let longSymbol: String = "meter"
    
}
public extension OfflineUnit where Self == Meter {
      static var meter : Meter { .init() }
}
