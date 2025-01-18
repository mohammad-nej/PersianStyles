//
//  OfflineCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol OfflineUnit : Sendable, Unit where CalcType == Offline {
     func convertToReferance(_ amount : Double) -> Double
    
    ///Convert your amount from Referance currency
     func convertFromReferance(_ amount : Double) -> Double
}
public extension OfflineUnit  where Self == TypeUnit.ReferenceUnit {
      func convertToReferance(_ amount : Double) -> Double {
        return amount
    }
    
    ///Convert your amount from Referance currency
     func convertFromReferance(_ amount : Double) -> Double{
        return amount
    }
    
}
