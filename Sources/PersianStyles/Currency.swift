//
//  Currency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/7/25.
//


public enum Currency: String , CaseIterable {
    case rial = "ریال"
    
    case toman = "تومان"
    
    public static var refrenceCurrency : Self {
        .rial
    }
  
  
}
