//
//  AnyCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/18/25.
//
import Foundation

public typealias AnyOfflineCurrency = AnyOffline<Currency>

public struct AnyOffline<TYPE : UnitType>: OfflineUnit  {
    public static var id: UUID { .init()}
    
    
    
    public let id : UUID 
    
    private let convertToFunc : @Sendable (Double) -> Double
    private let convertFromFunc : @Sendable (Double) -> Double
    
    
    public func convertToReferance(_ amount: Double) -> Double {
        convertToFunc(amount)
    }
    
    public func convertFromReferance(_ amount: Double) -> Double {
        convertFromFunc(amount)
    }
    
    public typealias TypeUnit = TYPE
    
    public typealias CalcType = Offline
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    public init<Money : OfflineUnit>(_ currency : Money) where Money.CalcType == Offline  , Money.TypeUnit == TYPE{
        self.id = currency.id
        self.convertToFunc = { double in
            currency.convertToReferance(double)
        }
        self.convertFromFunc = { double in
            currency.convertFromReferance(double)
        }
        self.shortSymbol = currency.shortSymbol
        self.longSymbol = currency.longSymbol
    }
}
public extension AnyOffline {
    
    static func == (lhs: AnyOffline<TYPE>, rhs: AnyOffline<TYPE>) -> Bool {
        return lhs.id == rhs.id
    }
    
}
