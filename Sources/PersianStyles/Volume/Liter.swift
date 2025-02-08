//
//  Litr.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct Liter : OfflineUnit,SerializableUnit {
    public var ratio: Double = 0.001
    
  
    public typealias TypeUnit = Volume
    
    
    
    public var shortSymbol: String = "lr"
    
    public var longSymbol: String = "Liter"
    public init(){
        
    }
    
    
    
}
public extension OfflineUnit where Self == Liter {
    static var lr: Self { .init() }
}
