//
//  UnitType.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

public protocol UnitType : Sendable {
    associatedtype ReferenceUnit
}

public enum Lenght: UnitType {
    public typealias ReferenceUnit = Centimeter
}

public enum Currency : UnitType {
    public typealias ReferenceUnit = Riyal
}

public extension UnitType {
    ///Print the output of this  function to get info about ReferenceUnit of this UnitType
      func info() -> String {
        "Reference Unit for \(Self.self) is \(Self.ReferenceUnit.self)"
    }
}
