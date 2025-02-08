//
//  Gram,.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/6/25.
//

public struct Weight : UnitType {
    public typealias ReferenceUnit = Gram
    public init(){}
    public static let name = "Weight"
}


public struct Gram : OfflineUnit, SerializableUnit {
    public var ratio: Double = 1
    
    
    public typealias TypeUnit = Weight
    
    public init() {
        self.shortSymbol = "gr"
        self.longSymbol = "gram"
    }
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    
}

public extension OfflineUnit where Self == Gram {
    static var gr : Gram { .init() }
}
