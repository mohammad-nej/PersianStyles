//
//  Numerables.swift
//  DBEngine
//
//  Created by MohammavDev on 2/5/25.
//






public struct OnePeice : CodableOfflineUnit{
    public var ratio: Double = 1
    
  
    
    public typealias TypeUnit = Numerable
    
    public init(shortSymbol: String, longSymbol : String){
        self.longSymbol = longSymbol
        self.shortSymbol = shortSymbol
    }
    
    public let shortSymbol: String
    
    public let longSymbol: String
}

public struct Grouped : CodableOfflineUnit {
    
     public init(shortSymbol: String, longSymbol: String, ratio: Double) {
        self.shortSymbol = shortSymbol
        self.longSymbol = longSymbol
        self.ratio = ratio
        
    }
    
    public typealias TypeUnit = Numerable
    
    public typealias CalcType = Offline
    
    public var shortSymbol: String
    
    public var longSymbol: String
    
    public let ratio: Double
    
}
public extension OfflineUnit where Self == Grouped {
     static func grouped(_ peiceInEach: Double) -> Self {
        Grouped(shortSymbol: "", longSymbol: "", ratio: peiceInEach)
    }
}
public extension OfflineUnit where Self == OnePeice {
    static var one : Self {
        OnePeice(shortSymbol: "one", longSymbol: "one")
    }
 
    static var pair : Self {
        OnePeice(shortSymbol: "pair", longSymbol: "pair")
    }
}

