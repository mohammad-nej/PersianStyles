//
//  Currency.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/7/25.
//


enum Currency: String , CaseIterable {
    case rial = "ریال"
    
    case toman = "تومان"
    
    static var refrenceCurrency : Self {
        .rial
    }
  
  
}