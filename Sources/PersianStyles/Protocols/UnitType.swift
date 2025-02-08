//
//  UnitType.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

public protocol UnitType : Sendable , Equatable {
    associatedtype ReferenceUnit
    static var name : String { get}
    init()
   
}

public struct Lenght: UnitType {
    public typealias ReferenceUnit = Centimeter
    public init(){}
    public static let name = "Lenght"
}

public struct Currency : UnitType {
    public typealias ReferenceUnit = Riyal
    public init(){}
    public static let name = "Currency"
}

public extension UnitType {
    ///Print the output of this  function to get info about ReferenceUnit of this UnitType
      func info() -> String {
        "Reference Unit for \(Self.self) is \(Self.ReferenceUnit.self)"
    }
}
