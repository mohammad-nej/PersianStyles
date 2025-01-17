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
