//
//  IntExtensions.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/7/25.
//


import Foundation


public extension Int {
    
    var persianNumberUnSeparated : String{
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "fa_IR")
        numberFormatter.numberStyle = .none
        
        
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        let stringified = numberFormatter.string(from: NSNumber(value: self))!
        return stringified
    }
    
    var persianNumber : String{
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "fa_IR")
        numberFormatter.numberStyle = .decimal
        
        
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        let stringified = numberFormatter.string(from: NSNumber(value: self))!
        return stringified
    }
    func convert(from currenct : Currency ,to currency : Currency) -> Int {
        let copy = currenct
//        if  copy == nil {
//            copy = Currency.rial.current
//        }
        
        let exchangeRate = 10
        switch (copy ,currency) {
        case (.rial ,.toman):
            return Int(self / exchangeRate)
        case (.toman ,.rial):
            return Int(self * exchangeRate)
            
        case (.toman, .toman):
            return self
        case (.rial, .rial):
            return self
        }
    }

}

public extension Int {
    func persianFormat(_ currency : Currency? = nil) -> String{
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
        let number = currentCurrency == .rial ? self : self / 10
        let stringified = number.persianNumber
        return "\(stringified) \(currentCurrency.rawValue) "
    }
}


extension Bool {
    
    init?(_ description : String){
        if description == "true" {
            self.self = true
        }else if description == "false" {
            self.self = false
        }else{
            return nil
        }
        
    }
    
    
}
