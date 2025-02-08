//
//  DynamicUnitProtocol.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//
import Foundation


///This is usefull when you want to save/load your type from Database, which let you have user-defined types e.g.  a pallet of Water bottel contains 200 bottels
/// - Warning: the `name` elements is used as `identifier` thus must be unique !
public struct SerializedUnit : Sendable, Equatable,Hashable,Codable,Identifiable {
    public let name : String
    public var id : String { name}
    public let typeName : String
    public let ratio : Double
    public let shortSymbol : String
    public let longSymbol : String
    
    public static func == (lhs: SerializedUnit, rhs: SerializedUnit) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public init(name: String, typeName: String, ratio: Double, shortSymbol: String, longSymbol: String) {
        self.name = name
        self.typeName = typeName
        self.ratio = ratio
        self.shortSymbol = shortSymbol
        self.longSymbol = longSymbol
    }
}



