//
//  SerializableUnit.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//


import Foundation


public protocol SerializableUnit {
    
    ///the conversion rate between this type and RefereanceType for your UnitType. e.g. for Meter ( considering RefereanceUnit is Centimeter) this number should be 100
    var ratio : Double { get }
    
    var serializedUnit : SerializedUnit { get }
    
}

public extension OfflineUnit where Self : SerializableUnit {
    var serializedUnit : SerializedUnit {
        SerializedUnit(name: longSymbol.capitalized, typeName: Self.TypeUnit.name, ratio: ratio, shortSymbol:shortSymbol , longSymbol: longSymbol)
    }
    func convertToReferance(_ amount : Double) -> Double {
        return amount * ratio
  }
  
  ///Convert your amount from Referance unit
   func convertFromReferance(_ amount : Double) -> Double{
       return amount / ratio
  }


}

