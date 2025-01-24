//
//  Unit.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol Unit : Sendable , Equatable , Identifiable , Hashable {
    
    
    
    associatedtype TypeUnit : UnitType
    associatedtype CalcType : CalculationType
    var shortSymbol : String { get }
    var longSymbol : String { get }

}
extension Unit {
    public var id : String {
        longSymbol
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
