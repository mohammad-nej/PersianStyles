//
//  Centimeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

import Foundation
public struct Centimeter : OfflineUnit {
    public static let id: UUID = UUID()
     public init(){
        
    }

    public typealias TypeUnit = Lenght
    
    
    
    public   let shortSymbol: String = "cm"
    
    public   let longSymbol: String = "centimeter"

}
public extension OfflineUnit where Self == Centimeter {
    static   var cm : Self {
        return .init()
    }
}
