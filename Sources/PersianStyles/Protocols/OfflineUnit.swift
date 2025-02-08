//
//  OfflineCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol OfflineUnit : Sendable, Unit  ,Equatable ,Identifiable where CalcType == Offline {
    ///Convert amounf from current Unit to Referance
    func convertToReferance(_ amount : Double) -> Double
    
    ///Convert your amount from Referance unit to current unit
     func convertFromReferance(_ amount : Double) -> Double
}

