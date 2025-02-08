//
//  MiliLitr.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct MiliLiter: OfflineUnit,SerializableUnit {
    public var ratio: Double = 0.000_001
    
    
 
    public typealias TypeUnit = Volume
    
    
    
    public var shortSymbol: String = "ml"
    
    public var longSymbol: String = "milliliter"
    
    public init(){
        
    }
    
    
}
public extension OfflineUnit where Self == MiliLiter {
    static var ml : MiliLiter { .init() }
}
