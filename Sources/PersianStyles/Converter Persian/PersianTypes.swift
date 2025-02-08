//
//  PersianTypes.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/8/25.
//

struct Joft : OfflineUnit, SerializableUnit , PersianTranslateable {
    
    
    
    var ratio : Double = 2
    
    
    typealias TypeUnit = Numerable
    
    
    
    var shortSymbol: String = "جفت"
    
    var longSymbol: String = "جفت"
    
    var persianName = "جفت"
}
struct Adad : CodableOfflineUnit , PersianTranslateable {
    
    var ratio : Double = 1
    
    typealias TypeUnit = Numerable
    
    var shortSymbol: String = "عدد"
    
    var longSymbol: String = "عدد"
    
    var persianName = "عدد"
}
