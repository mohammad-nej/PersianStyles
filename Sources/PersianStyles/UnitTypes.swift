//
//  UnitTypes.swift
//  DBEngine
//
//  Created by MohammavDev on 2/6/25.
//
import Foundation
protocol UnitPresenter : Sendable, Codable {
    
    func presentedUnit() -> any OfflineUnit
}


public enum CountingType : String , Sendable,Codable , CaseIterable {
    
    
    
    case numberable , lenght , weight, area, volume
    
    var unitType : any UnitType {
        switch  self
        {
        case .numberable:
            return Numerable()
        case .lenght:
            return Lenght()
        case .weight:
            return  Weight()
        case .volume:
            return  Volume()
        case .area:
            return  Area()
        }
    }
    
}
