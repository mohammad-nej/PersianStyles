//
//  CubicMeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct CubicMeter : OfflineUnit, SerializableUnit {
    public var ratio: Double = 1
    
  
    public typealias TypeUnit = Volume
    
    
    
    public var shortSymbol: String = "m^3"
    
    public var longSymbol: String = "Cubic meter"
    public init(){
        
    }
    
    
}
public extension OfflineUnit where Self == CubicMeter {
    static var m3: Self { .init() }
}
