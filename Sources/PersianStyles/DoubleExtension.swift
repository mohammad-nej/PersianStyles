//
//  DoubleExtension.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/7/25.
//

import Foundation
public extension Double {
    var persianNumber : String{
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "fa_IR")
        numberFormatter.numberStyle = .decimal
        
        
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        let stringified = numberFormatter.string(from: NSNumber(value: self))!
        return stringified
    }

}
