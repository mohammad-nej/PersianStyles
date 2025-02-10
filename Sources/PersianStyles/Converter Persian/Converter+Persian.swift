//
//  Converter+Persian.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/8/25.
//
 extension Dollar : PersianTranslateable {
    public var persianName: String { "دلار"}
}
extension Riyal : PersianTranslateable {
    public var persianName: String { "ریال"}
}
extension Toman : PersianTranslateable {
    public var persianName: String { "تومان"}
}
extension Ton : PersianTranslateable {
    public var persianName: String {"تن"}
}
extension Kilometer : PersianTranslateable {
    public var persianName: String {"کیلومتر"}
}
extension Liter : PersianTranslateable {
    public var persianName: String {"لیتر"}
}
extension Gram : PersianTranslateable {
    public var persianName: String {"گرم"}
}
extension KiloGram : PersianTranslateable {
    public var persianName: String {"کیلوگرم"}
}
extension Centimeter : PersianTranslateable {
    public var persianName: String {"سانتیمتر"}
}
extension Meter : PersianTranslateable {
    public var persianName: String {"میلیمتر"}
}
extension Hektar : PersianTranslateable {
    public var persianName: String {"هکتار"}
}
extension SquareMeter : PersianTranslateable {
    public var persianName: String {"متر مربع"}
}
extension SquareCM : PersianTranslateable {
    public var persianName: String {"سانتیمتر مربع"}
}
extension CubicCentimeter : PersianTranslateable {
    public var persianName: String {"سانتیمتر مکعب"}
}
extension CubicMeter : PersianTranslateable {
    public var persianName: String {"متر مکعب"}
}


public extension SerializedUnit {
    static var adad : SerializedUnit {
        Adad().serializedUnit
    }
    static var joft : SerializedUnit {
        Joft().serializedUnit
    }
}
