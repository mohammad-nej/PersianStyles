//
//  Hektar.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct Hektar : OfflineUnit,SerializableUnit {
    public var ratio: Double = 10_000
    
    public init(){
        
    }
    
    public typealias TypeUnit = Area
    
   
    
    public var shortSymbol: String = "هكتار"
    
    public var longSymbol: String = "هكتار"
    
    
    
    
    
}
public extension OfflineUnit where Self == Hektar{
    static var hektar: Hektar { .init() }
}
