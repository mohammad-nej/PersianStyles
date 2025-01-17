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
