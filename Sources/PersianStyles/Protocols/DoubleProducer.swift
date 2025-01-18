//
//  PersianConvertible.swift
//  PersianStyles
//
//  Created by MohammavDev on 1/16/25.
//

public protocol DoubleProducer : Sendable {
    var value : Double { get }
}

 extension Double : DoubleProducer {
     public var value : Double { self }
}

 extension Float : DoubleProducer {
     public var value : Double { Double(self) }
}
 extension Int : DoubleProducer {
     public var value : Double { Double(self) }
}

public extension DoubleProducer {
    func persianFormat<From : OfflineUnit, To: OfflineUnit>(_ base : From , to : To , withSymbols : Bool = true  ) -> String where From.TypeUnit == To.TypeUnit{
        
        let manager = Converter(type: From.TypeUnit.self)
         let converted = manager.convert(self.value, from: base, to: to)
        
        let inPersian = converted.persianNumber
        
         
         let symbol =  to.longSymbol
         return "\(inPersian) \(withSymbols ? symbol : "")"
    }
    
}
public extension DoubleProducer {
    
    func convert<From : OfflineUnit, To: OfflineUnit>(_ base : From , to : To ) -> Double where From.TypeUnit == To.TypeUnit{
        
        let manager = Converter(type: From.TypeUnit.self)
        return manager.convert(self.value, from: base, to: to)
      
    }
    func convert<From : OnlineUnit, To: OfflineUnit>(_ base : From , to : To ) async throws -> Double where From.TypeUnit == To.TypeUnit{
        
        let manager = Converter(type: From.TypeUnit.self)
        return try await manager.convert(self.value, from: base, to: to)
      
    }
    func convert<From : OfflineUnit, To: OnlineUnit>(_ base : From , to : To  )  async throws -> Double where From.TypeUnit == To.TypeUnit{
        
        let manager = Converter(type: From.TypeUnit.self)
        return try await manager.convert(self.value, from: base, to: to)
      
    }
    func convert<From : OnlineUnit, To: OnlineUnit>(_ base : From , to : To) async throws -> Double where From.TypeUnit == To.TypeUnit{
        
        let manager = Converter(type: From.TypeUnit.self)
        return try await manager.convert(self.value, from: base, to: to)
      
    }
    
    
}
