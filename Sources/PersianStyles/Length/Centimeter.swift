//
//  Centimeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


public struct Centimeter : OfflineUnit {
  
    fileprivate init(){
        
    }
    
    public static func convertToReferance(_ amount: Double) -> Double {
        return amount
    }
    
    public static func convertFromReferance(_ amount: Double) -> Double {
        return amount
    }
    
    public typealias TypeUnit = Lenght
    
    
    
    public static let shortSymbol: String = "cm"
    
    public static let longSymbol: String = "centimeter"
    
    
    
    
}
public extension OfflineUnit where Self == Centimeter {
    static var cm : Self {
        return .init()
    }
}
