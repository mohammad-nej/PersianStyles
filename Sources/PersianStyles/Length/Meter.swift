//
//  Meter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import Foundation
public struct Meter : OfflineUnit, Codable, SerializableUnit {
    public var ratio: Double = 100
    
    
    public static let id: UUID = UUID()
    
    public init(){
        shortSymbol = "m"
        longSymbol = "meter"
    }
    
  
    public typealias TypeUnit = Lenght
    
    
    
    public   var shortSymbol: String
    
    public   var longSymbol: String
    
}
public extension OfflineUnit where Self == Meter {
      static var meter : Meter { .init() }
}
