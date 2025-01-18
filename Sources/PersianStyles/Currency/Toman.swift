//
//  Toman.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public struct Toman : Sendable,OfflineUnit {
  
    public typealias TypeUnit = Currency
   
     init() {
        
    }
    public typealias CalcType = Offline
    
    public    let shortSymbol: String = "تومان"
    
    public    let longSymbol: String = "تومان"
    public typealias Referance = Riyal
    
    ///Convert Toman to Rial
    public   func convertToReferance(_ amount: Double) -> Double {
        amount * 10
    }
    ///Convert Rial to Toman
    public   func convertFromReferance(_ amount: Double) -> Double {
        amount / 10
    }
}

public extension OfflineUnit where Self == Toman {
    static   var toman : Toman { .init() }
}
