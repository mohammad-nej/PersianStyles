//
//  AnyOnline.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/18/25.
//
import Foundation

public enum CodingError : Error {
    case shouldntLoadFromCoding
}

public typealias AnyOnlineCurrency = AnyOnline<Currency>

///Type eraser for putting types in a single array.
/// - Warning: Despite confroming to `Codable` protocol, this type shouldn't be Encoded/Decoded cause it will wont work!
public struct AnyOnline<TYPE : UnitType>: OnlineUnit   {


    
    public static var id : UUID { .init()}
    
    
    public var id : String = ""
    
    private var convertToFunc : @Sendable (Double,Date) async throws -> Double
    private var convertFromFunc : @Sendable (Double,Date) async throws -> Double
    
    
    public func convertToReferance(_ amount: Double, in date: Date) async throws -> Double {
        return try await convertToFunc(amount,date)
    }
    
    public func convertFromReferance(_ amount: Double, in date: Date) async throws -> Double {

        return try await convertFromFunc(amount,date)
    }
    
    ///To sielnce swift Codable errors, this type shouldnt be Encoded/Decoded
    private enum CodingKeys: String, CodingKey {
           case shortSymbol, longSymbol
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
