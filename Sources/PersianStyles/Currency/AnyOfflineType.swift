//
//  AnyCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/18/25.
//

public typealias AnyOfflineCurrency = AnyOffline<Currency>
public struct AnyOffline<TYPE : UnitType>: OfflineUnit  {
    
    
    
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

