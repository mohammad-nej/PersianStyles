//
//  KiloGram.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/6/25.
//


public struct KiloGram : OfflineUnit,SerializableUnit {
    public var ratio: Double = 1000
    

    
    public typealias TypeUnit = Weight
    
    public init() {
        self.shortSymbol = "kilo"
        self.longSymbol = "kilogram"
    }
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    
}

public extension OfflineUnit where Self == KiloGram {
    static var kg : KiloGram { .init() }
}
