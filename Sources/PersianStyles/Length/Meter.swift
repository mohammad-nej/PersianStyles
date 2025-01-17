//
//  Meter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

public struct Meter : OfflineUnit {
    fileprivate init(){
        
    }
    
    public static func convertToReferance(_ amount: Double) -> Double {
        return amount * 100
    }
    
    public static func convertFromReferance(_ amount: Double) -> Double {
        return amount / 100
    }
    
    public typealias TypeUnit = Lenght
    
    
    
    public static let shortSymbol: String = "m"
    
    public static let longSymbol: String = "meter"
    
}
public extension OfflineUnit where Self == Meter {
    static var meter : Meter { .init() }
}
