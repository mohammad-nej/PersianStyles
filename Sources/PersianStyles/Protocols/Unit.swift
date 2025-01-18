//
//  Unit.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol Unit : Sendable , Equatable , Identifiable , Hashable {
    
    static var id : UUID { get }
    
    associatedtype TypeUnit : UnitType
    associatedtype CalcType : CalculationType
    var shortSymbol : String { get }
    var longSymbol : String { get }

}
extension Unit {
    public var id : UUID {
        Self.id
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        type(of: lhs).id == type(of: rhs).id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Self.id)
    }
}
