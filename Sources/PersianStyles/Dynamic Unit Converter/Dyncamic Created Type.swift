//
//  Dyncamic Created Type.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//


///This is used internally to convert a SerializedUnit into an OfflineUnit for Converter 
 struct Dynamic<T : UnitType> : OfflineUnit {
     func convertToReferance(_ amount: Double) -> Double {
        amount * ratio
    }
    
     func convertFromReferance(_ amount: Double) -> Double {
        amount / ratio
    }
    
     typealias TypeUnit = T
    
     typealias CalcType = Offline
    
     let shortSymbol: String
    
     let longSymbol: String
    
    
    ///This is the ratio between your type and your UnitType.ReferanceType .
     let ratio : Double
    
     init(shortSymbol: String, longSymbol: String, ratio: Double) {
        self.shortSymbol = shortSymbol
        self.longSymbol = longSymbol
        self.ratio = ratio
       
    }
     init(_ type : T.Type ,shortSymbol: String, longSymbol: String, ratio: Double ){
         self.shortSymbol = shortSymbol
         self.longSymbol = longSymbol
         self.ratio = ratio
     }
 
    
}
