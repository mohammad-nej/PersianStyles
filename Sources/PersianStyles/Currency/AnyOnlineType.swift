//
//  AnyOnline.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/18/25.
//
import Foundation


public typealias AnyOnlineCurrency = AnyOnline<Currency>

public struct AnyOnline<TYPE : UnitType>: OnlineUnit  {
  
    public static var id : UUID { .init()}
    
    
    public let id : UUID
    
    private let convertToFunc : @Sendable (Double,Date) async throws -> Double
    private let convertFromFunc : @Sendable (Double,Date) async throws -> Double
    
    
    public func convertToReferance(_ amount: Double, in date: Date) async throws -> Double {
        try await convertToFunc(amount,date)
    }
    
    public func convertFromReferance(_ amount: Double, in date: Date) async throws -> Double {
        try await convertFromFunc(amount,date)
    }
    
    public typealias TypeUnit = TYPE
    
    public typealias CalcType = Online
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    public init<ONLINE : OnlineUnit>(_ unit : ONLINE) where ONLINE.CalcType == Online  , ONLINE.TypeUnit == TYPE{
        
        self.id = unit.id
        
        self.convertToFunc = { double,date in
            try await unit.convertToReferance(double, in: date)
        }
        self.convertFromFunc = { double,date in
            try await unit.convertFromReferance(double, in: date)
        }
        self.shortSymbol = unit.shortSymbol
        self.longSymbol = unit.longSymbol
    }
}
public extension AnyOnline {
    
    static func == (lhs: AnyOnline<TYPE>, rhs: AnyOnline<TYPE>) -> Bool {
        return lhs.id == rhs.id
    }
    
}
