//
//  Centimeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

import Foundation
public struct Centimeter : CodableOfflineUnit {
    public var ratio: Double = 1
    
    public static let id: UUID = UUID()
    public init(){
        shortSymbol = "cm"
        longSymbol = "centimeter"
    }

    public typealias TypeUnit = Lenght
    
    
    
    public   var shortSymbol: String
    
    public   var longSymbol: String

   
}
public extension OfflineUnit where Self == Centimeter {
    static var cm : Self {
        return .init()
    }
}
