//
//  DynamicConverter.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/8/25.
//

///This is usefull if you want to convert  2 SerializedUnits to each other with out specifing their UnitType
public struct DynamicConverter : Sendable {
    public init(){}
     public func convert(_ amount : DoubleProducer , from base : SerializedUnit, to destination : SerializedUnit) throws -> Double  {
         
        guard base.typeName == destination.typeName else {
             throw TypeErrors.unmatchingUnits(base.typeName,destination.typeName)
        }
      
        //becuase we know that they have the same types , we can bypass creating converter
        let toReferance = amount.value * base.ratio
        let toDestination = toReferance / destination.ratio
        
        return toDestination
    }
}
