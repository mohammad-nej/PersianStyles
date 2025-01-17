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
    
    public static func convertTo(_ amount: Double, in date: Date) async throws -> Double {
        return try await amount * getRate(at: date)
    }
    
    public static func convertFrom(_ amount: Double, in date: Date) async throws -> Double {
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
