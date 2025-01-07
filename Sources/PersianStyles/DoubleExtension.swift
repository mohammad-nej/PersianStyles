//
//  DoubleExtension.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/7/25.
//

import Foundation
extension Double {
    func persianFormat(_ currency : Currency? = nil,withSymbol : Bool = true) -> String{
        var currentCurrency : Currency
        if let currency{
            currentCurrency = currency
        }else{
            
            let currencyString = UserDefaults.standard.string(forKey: Currency.rial.rawValue)
            
            if let currencyString {
                
                currentCurrency = Currency(rawValue: currencyString) ?? .rial
            }else{
                debugginLogger.error("currency is not set")
                currentCurrency = .rial
            }
        }
        let number = self.convert(from: Currency.refrenceCurrency, to: currentCurrency)
        let stringified = number.persianNumber
        let result = withSymbol ? "\(stringified) \(currentCurrency.rawValue) " : stringified
        return result
    }
    func convert(from current : Currency,to currency : Currency) -> Double {
        let copy = current
//        if  copy == nil {
//            copy = Currency.getCurrent()
//        }
        
        let exchangeRate = 10.0
        switch (copy ,currency) {
        case (.rial ,.toman):
            return self / exchangeRate
        case (.toman ,.rial):
            return self * exchangeRate
            
        case (.toman, .toman):
            return self
        case (.rial, .rial):
            return self
        }
    }

    var persianNumber : String{
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "fa_IR")
        numberFormatter.numberStyle = .decimal
        
        
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        let stringified = numberFormatter.string(from: NSNumber(value: self))!
        return stringified
    }

}
