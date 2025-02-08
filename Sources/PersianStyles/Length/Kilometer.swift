//
//  Kilometer.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

import Foundation
public struct Kilometer : OfflineUnit, Codable,SerializableUnit {
    public var ratio: Double = 100_000
    
    
    public static let id: UUID = UUID()
    
    public init(){
        shortSymbol = "km"
        longSymbol = "kilometer"
    }
    
  
    
    public typealias TypeUnit = Lenght
    
    
    
    public   var shortSymbol: String
    
    public   var longSymbol: String
    
}
public extension OfflineUnit where Self == Kilometer {
      static var kilometer : Meter { .init() }
}
