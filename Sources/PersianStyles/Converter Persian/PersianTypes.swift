//
//  PersianTypes.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/8/25.
//

public struct Joft : OfflineUnit, SerializableUnit , PersianTranslateable {
    
    
    
    public var ratio : Double = 2
    
    
    public typealias TypeUnit = Numerable
    
    public init(){}
    
    public var shortSymbol: String = "جفت"
    
    public var longSymbol: String = "جفت"
    
    public var persianName = "جفت"
}
public struct Adad : CodableOfflineUnit , PersianTranslateable {
    
    public init() {}
    
    public var ratio : Double = 1
    
    public typealias TypeUnit = Numerable
    
    public var shortSymbol: String = "عدد"
    
    public var longSymbol: String = "عدد"
    
    public var persianName = "عدد"
}
public extension OfflineUnit where Self == Adad {
    static var adad : Adad { .init() }
}
public extension OfflineUnit where Self == Joft {
    static var joft : Joft { .init() }
}
