//
//  Cubic Centimeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public struct CubicCentimeter: OfflineUnit, SerializableUnit {
    public var ratio: Double = 0.000001
 
    
    public typealias TypeUnit = Volume
    
    
    
    public var shortSymbol: String = "cc"
    
    public var longSymbol: String = "cc"
    
    public init(){
        
    }
    
    
}
public extension OfflineUnit where Self == CubicCentimeter {
    static var ml : CubicCentimeter { .init() }
}
