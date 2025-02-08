//
//  CurrencyManager.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import SwiftUI
import Foundation


public struct Converter<Referance : UnitType>  : Sendable{
    
    
    let currentType : Referance.Type
    
    public init(type: Referance.Type) {
        
        self.currentType = type
    }
    
}
public extension Converter{
     func convert<From : OnlineUnit, To : OnlineUnit>(_ amount : any DoubleProducer ,
                                                             from sourceCurrency : From ,
                                                             to destinationCurrency : To ,
                                                 in date : Date = .now) async throws  -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance  {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = try await sourceCurrency.convertToReferance(amount.value, in: date)
            
            
            let converted = try await destinationCurrency.convertFromReferance(toRefrenceAmount, in: date)
            return converted
        }.value
    }
    func convert<From : OnlineUnit, To : OfflineUnit>(_ amount : any DoubleProducer  ,
                                                              from sourceCurrency : From,
                                                              to destinationCurrency : To ,
                                                 in date : Date = .now) async throws -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = try await sourceCurrency.convertToReferance(amount.value, in: date)
            
            
            let converted =  destinationCurrency.convertFromReferance(toRefrenceAmount)
            return converted
        }.value
    }
    
    func convert<From : OfflineUnit, To : OnlineUnit>(_ amount : any DoubleProducer  ,
                                                 from sourceCurrency : From,
                                                 to destinationCurrency : To ,
                                                 in date : Date = .now) async throws -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = sourceCurrency.convertToReferance(amount.value)
            
            
            let converted =  try await  destinationCurrency.convertFromReferance(toRefrenceAmount , in: date)
            return converted
        }.value
    }
    
    
    func convert<From : OfflineUnit, To : OfflineUnit>(_ amount : any DoubleProducer  ,
                                                 from sourceCurrency : From ,
                                                 to destinationCurrency : To
                                                )  -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        let toRefrenceAmount = sourceCurrency.convertToReferance(amount.value)
        
        let converted = destinationCurrency.convertFromReferance(toRefrenceAmount)
        return converted
        
    }
    
    
}
