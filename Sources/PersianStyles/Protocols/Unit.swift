//
//  Unit.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol Unit : Sendable {
    associatedtype TypeUnit : UnitType
    associatedtype CalcType : CalculationType
      var shortSymbol : String { get }
      var longSymbol : String { get }

}
