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
    func convert<Unit: OfflineUnit>(_ base : Unit,to coded : SerializedUnit) throws -> Double {
        let converter = Converter(type:Unit.TypeUnit.self)
        return try converter.convert(self.value, from: base, to: coded)
    }
    func convert<Unit: OfflineUnit>(_ coded : SerializedUnit,to other : Unit) throws -> Double {
        let converter = Converter(type:Unit.TypeUnit.self)
        return try converter.convert(self.value, from: coded, to: other)
    }
    func convert(_ base : SerializedUnit , to destination : SerializedUnit) throws -> Double{
        
        let converter = DynamicConverter()
        return try converter.convert(self.value, from: base, to: destination)
    }
}
public extension DoubleProducer{
    func convert<Unit: OnlineUnit>(_ base : Unit,to coded : SerializedUnit) async throws -> Double {
        let converter = Converter(type:Unit.TypeUnit.self)
        return try await converter.convert(self.value, from: base, to: coded)
    }
    func convert<Unit: OnlineUnit>(_ coded : SerializedUnit,to other : Unit) async throws -> Double {
        let converter = Converter(type:Unit.TypeUnit.self)
        return try await converter.convert(self.value, from: coded, to: other)
    }
}
