//
//  Ton.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/6/25.
//


public struct Ton : OfflineUnit, SerializableUnit {
    public var ratio: Double = 1_000_000
    

    
    public typealias TypeUnit = Weight
    
    public init() {
        self.shortSymbol = "ton"
        self.longSymbol = "ton"
    }
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    
}
public extension OfflineUnit where Self == Ton {
    static var ton : Ton { .init() }
}
