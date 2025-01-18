//
//  Dollar.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import Foundation
public struct Dollar : Sendable,OnlineUnit  {
    public static let id: UUID = UUID()
    

    
    public typealias TypeUnit = Currency
    
     public init(){
        
    }
    
    ///Convert Dollar to Riyal
    public   func convertToReferance(_ amount: Double, in date: Date) async throws -> Double {
        return try await amount * getRate(at: date)
    }
    
    ///convert Riyal to Dollar
    public   func convertFromReferance(_ amount: Double, in date: Date) async throws -> Double {
        return try await amount / getRate(at: date)
    }
    
      func getRate(at date: Date) async throws -> Double {
        return 800_000
    }
    
    public typealias Referance = Riyal
    
  
    
    public   let shortSymbol: String = "$"
    
    public   let longSymbol: String = "دلار"
    
}
public extension OnlineUnit where Self == Dollar{
    static  var dollar : Dollar {
        return Dollar()
    }
}
