//
//  Dollar.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import Foundation
public struct Dollar : Sendable,OnlineUnit  {
    public typealias TypeUnit = Currency
    
    fileprivate init(){
        
    }
    
    ///Convert Dollar to Riyal
    public static func convertToReferance(_ amount: Double, in date: Date) async throws -> Double {
        return try await amount * getRate(at: date)
    }
    
    ///convert Riyal to Dollar
    public static func convertFromReferance(_ amount: Double, in date: Date) async throws -> Double {
        return try await amount / getRate(at: date)
    }
    
    static func getRate(at date: Date) async throws -> Double {
        return 800_000
    }
    
    public typealias Referance = Riyal
    
  
    
    public static let shortSymbol: String = "$"
    
    public static let longSymbol: String = "دلار"
    
}
public extension OnlineUnit where Self == Dollar{
    static var dollar : Dollar {
        return Dollar()
    }
}
