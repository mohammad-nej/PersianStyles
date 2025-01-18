//
//  CurrencyManager.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//
import SwiftUI
import Foundation


public struct Converter<Referance : UnitType>  : Sendable{
    
    
    
    
    public init(type: Referance.Type = Currency.self) {
        
        
    }
    
    func convert<From : OnlineUnit, To : OnlineUnit>(_ amount : any DoubleProducer ,
                                                             from sourceCurrency : From ,
                                                             to destinationCurrency : To ,
                                                 in date : Date = .now) async throws  -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance  {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = try await type(of:sourceCurrency).convertToReferance(amount.value, in: date)
            
            
            let converted = try await type(of:destinationCurrency).convertFromReferance(toRefrenceAmount, in: date)
            return converted
        }.value
    }
    func convert<From : OnlineUnit, To : OfflineUnit>(_ amount : any DoubleProducer  ,
                                                              from sourceCurrency : From,
                                                              to destinationCurrency : To ,
                                                 in date : Date = .now) async throws -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = try await type(of:sourceCurrency).convertToReferance(amount.value, in: date)
            
            
            let converted =  type(of:destinationCurrency).convertFromReferance(toRefrenceAmount)
            return converted
        }.value
    }
    
    func convert<From : OfflineUnit, To : OnlineUnit>(_ amount : any DoubleProducer  ,
                                                 from sourceCurrency : From,
                                                 to destinationCurrency : To ,
                                                 in date : Date = .now) async throws -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        return try await Task.detached(priority: .userInitiated) {
            
            
            let toRefrenceAmount = type(of:sourceCurrency).convertToReferance(amount.value)
            
            
            let converted =  try await  type(of:destinationCurrency).convertFromReferance(toRefrenceAmount , in: date)
            return converted
        }.value
    }
    
    
    func convert<From : OfflineUnit, To : OfflineUnit>(_ amount : any DoubleProducer  ,
                                                 from sourceCurrency : From ,
                                                 to destinationCurrency : To
                                                )  -> Double
    where  From.TypeUnit == Referance , To.TypeUnit == Referance {
        
        let toRefrenceAmount = type(of:sourceCurrency).convertToReferance(amount.value)
        
        let converted = type(of:destinationCurrency).convertFromReferance(toRefrenceAmount)
        return converted
        
    }
    
    
}
