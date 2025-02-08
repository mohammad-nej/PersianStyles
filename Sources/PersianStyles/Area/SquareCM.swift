//
//  SquareCM.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct SquareCM : OfflineUnit ,SerializableUnit{
    public var ratio: Double = 10_000
    
  
    
    public typealias TypeUnit = Area
    
    public init(){
        
    }
    
    public var shortSymbol: String = "cm^2"
    
    public var longSymbol: String = "سانتی متر مربع"
    
    
}
public extension OfflineUnit where Self == SquareCM{
    static var squareCM: SquareCM { .init() }
}
