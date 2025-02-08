//
//  ConverterBuilder.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/8/25.
//

///A builder to create a Converter for ease of use
public struct ConverterBuilder : Sendable {
    
    public static func NumberableConverter() -> Converter<Numerable> {
        return Converter(type: Numerable.self)
    }
    public static func WeightConverter() -> Converter<Weight> {
        return Converter(type: Weight.self)
    }
    public static func LengthConverter() -> Converter<Lenght> {
        return Converter(type: Lenght.self)
    }
    public static func CurrencyConverter() -> Converter<Currency> {
        return Converter(type: Currency.self)
    }
    public static func AreaConverter() -> Converter<Area> {
        return Converter(type: Area.self)
    }
    public static func VolumeConverter() -> Converter<Volume> {
        return Converter(type: Volume.self)
    }
    
    ///This can be used to convert 2 SerializedUnits to each other without knowing their types at compile-time
    public static func DynamicConverter() -> DynamicConverter{
        return PersianStyles.DynamicConverter()
    }
}
