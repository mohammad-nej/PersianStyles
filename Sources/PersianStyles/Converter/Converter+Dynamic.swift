//
//  Converter+Dynamic.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/7/25.
//

public extension Converter {
    public func convert<T : OfflineUnit>(_ amount : DoubleProducer , from baseUnit : T , to unkonwnUnit : SerializedUnit) throws -> Double where T.TypeUnit == Referance {
        
        guard Referance.name == unkonwnUnit.typeName else {
            throw TypeErrors.unmatchingUnits(Referance.name,unkonwnUnit.typeName)

        }

        let dynamicUnit = Dynamic<T.TypeUnit>(shortSymbol:unkonwnUnit.shortSymbol, longSymbol:unkonwnUnit.longSymbol, ratio:unkonwnUnit.ratio)
        
        
        
        return self.convert(amount, from: baseUnit, to: dynamicUnit)
        
    }
    
     func convert<T : OnlineUnit>(_ amount : DoubleProducer , from baseUnit : T , to unkonwnUnit : SerializedUnit) async throws -> Double where T.TypeUnit == Referance {
        
        guard Referance.name == unkonwnUnit.typeName else {
            throw TypeErrors.unmatchingUnits(Referance.name,unkonwnUnit.typeName)

        }

        let dynamicUnit = Dynamic<T.TypeUnit>(shortSymbol:unkonwnUnit.shortSymbol, longSymbol:unkonwnUnit.longSymbol, ratio:unkonwnUnit.ratio)
        
        
        
        return try await self.convert(amount, from: baseUnit, to: dynamicUnit)
        
    }

    
    public func convert(_ amount : DoubleProducer , from base : SerializedUnit, to destination : SerializedUnit) throws -> Double  {
        guard base.typeName == destination.typeName else {
             throw TypeErrors.unmatchingUnits(base.typeName,destination.typeName)
        }
      
        //becuase we know that they have the same types , we can bypass creating converter
        let toReferance = amount.value * base.ratio
        let toDestination = toReferance / destination.ratio
        
        return toDestination
    }
     func convert<T : OfflineUnit>(_ amount : DoubleProducer ,from unkonwnUnit : SerializedUnit, to otherUnit : T) throws -> Double where T.TypeUnit == Referance {

        let dynamicUnit = Dynamic<T.TypeUnit>(shortSymbol:unkonwnUnit.shortSymbol, longSymbol:unkonwnUnit.longSymbol, ratio:unkonwnUnit.ratio)
        
        
        
        return self.convert(amount, from: dynamicUnit, to: otherUnit)
        
    }
    public func convert<T : OnlineUnit>(_ amount : DoubleProducer ,from unkonwnUnit : SerializedUnit, to otherUnit : T) async throws -> Double where T.TypeUnit == Referance {
        
        guard Referance.name == unkonwnUnit.typeName else {
            throw TypeErrors.unmatchingUnits(Referance.name,unkonwnUnit.typeName)

        }
        
        let dynamicUnit = Dynamic<T.TypeUnit>(shortSymbol:unkonwnUnit.shortSymbol, longSymbol:unkonwnUnit.longSymbol, ratio:unkonwnUnit.ratio)
        
        
        
        return try await self.convert(amount, from: dynamicUnit, to: otherUnit)
        
    }
    
}
public extension Converter {
    static func convert(_ amount : DoubleProducer , from base : SerializedUnit, to destination : SerializedUnit) throws -> Double  {
        guard base.typeName == destination.typeName else {
             throw TypeErrors.unmatchingUnits(base.typeName,destination.typeName)
        }
      
        //becuase we know that they have the same types , we can bypass creating converter
        let toReferance = amount.value * base.ratio
        let toDestination = toReferance / destination.ratio
        
        return toDestination
    }

}
