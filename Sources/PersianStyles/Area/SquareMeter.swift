//
//  SquareMeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct SquareMeter : OfflineUnit,SerializableUnit {
    public var ratio: Double = 1
    
 
    public typealias TypeUnit = Area
    
    public init(){
        
    }
    
    public var shortSymbol: String = "m^2"
    
    public var longSymbol: String = "متر مربع"
    
    
    
    
    
}
public extension OfflineUnit where Self == SquareMeter{
    static var squareMeter: SquareMeter { .init() }
}
