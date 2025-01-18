//
//  OnlineCurrency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


import SwiftUI
import Foundation

public protocol OnlineUnit : Sendable, Unit where CalcType == Online {
    static func convertToReferance(_ amount : Double , in date : Date) async throws -> Double
    static func convertFromReferance(_ amount : Double, in date : Date) async throws -> Double
}
