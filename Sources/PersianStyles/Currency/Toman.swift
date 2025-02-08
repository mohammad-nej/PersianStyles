//
//  Toman.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public struct Toman : Sendable,OfflineUnit , SerializableUnit {
    public var ratio: Double = 10
    
  
    public static let id: UUID = UUID()
    
    public typealias TypeUnit = Currency
   
     public init() {
        
    }
    public typealias CalcType = Offline
    
    public    let shortSymbol: String = "تومان"
    
    public    let longSymbol: String = "تومان"
    public typealias Referance = Riyal
 
}

public extension OfflineUnit where Self == Toman {
    static   var toman : Toman { .init() }
}
