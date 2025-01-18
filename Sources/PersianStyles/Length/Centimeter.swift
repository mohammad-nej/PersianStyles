//
//  Centimeter.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//


public struct Centimeter : OfflineUnit {
  
     init(){
        
    }

    public typealias TypeUnit = Lenght
    
    
    
    public   let shortSymbol: String = "cm"
    
    public   let longSymbol: String = "centimeter"

}
public extension OfflineUnit where Self == Centimeter {
    static   var cm : Self {
        return .init()
    }
}
