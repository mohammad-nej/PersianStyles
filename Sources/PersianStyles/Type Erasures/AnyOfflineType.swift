//
//  AnyCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/18/25.
//
import Foundation

public typealias AnyOfflineCurrency = AnyOffline<Currency>

///a type-erasure for putting all your offline types in a single array.

public struct AnyOffline<TYPE : UnitType>: OfflineUnit  {
    public static var id: UUID { .init()}
    
    
    
    public var id : String = ""
    
    private var convertToFunc : @Sendable (Double) -> Double
    private var convertFromFunc : @Sendable (Double) -> Double
    
    
    public func convertToReferance(_ amount: Double) -> Double {
        return convertToFunc(amount)
    }
    
    public func convertFromReferance(_ amount: Double) -> Double {
        return convertFromFunc(amount)
    }
    
    public typealias TypeUnit = TYPE
    
    public typealias CalcType = Offline
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    
    ///To sielnce swift Codable errors, this type shouldnt be Encoded/Decoded
    private enum CodingKeys: String, CodingKey {
           case shortSymbol, longSymbol
    }

    
    public init<Money : OfflineUnit>(_ currency : Money) where Money.CalcType == Offline  , Money.TypeUnit == TYPE{
        
        self.convertToFunc = { double in
            currency.convertToReferance(double)
        }
        self.convertFromFunc = { double in
            currency.convertFromReferance(double)
        }
        self.shortSymbol = currency.shortSymbol
        self.longSymbol = currency.longSymbol
        self.id = currency.longSymbol
    }
}
public extension AnyOffline {
    
    static func == (lhs: AnyOffline<TYPE>, rhs: AnyOffline<TYPE>) -> Bool {
        return lhs.id == rhs.id
    }
    
}


public extension AnyOfflineCurrency {
    
    static var toman : AnyOfflineCurrency {
        .init(.toman)
    }
    static var rial : AnyOfflineCurrency {
        .init(.rial)
    }
    
}
