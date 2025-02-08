import Testing
import Foundation
 import PersianStyles

@Test func currencyCovnerter() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    
    let manager = Converter(type: Currency.self)
    
    let notEffect =  try await manager.convert(8450_000,from: .dollar, to : .dollar , in: .now)
    #expect(notEffect == 8450_000)
    
    let toman =   manager.convert(10_000.0, from: .rial, to: .toman)
    #expect(toman == 1000.0)
    
    let dollar =  try await manager.convert(800_000,from: .rial, to : .dollar , in: .now)
    #expect(dollar == 1)
    
    let toman2 = try await manager.convert(35, from: .dollar, to: .toman,in:.now)
    #expect(toman2 == Double(35 * 80_000))
    
    let _ = try await 90000.0.convert(.rial, to: .dollar)
   
     
    let rial = 9000.convert(.cm, to: .cm)
    
}
@Test func lengthConverter() async throws {
    let converter = Converter(type: Lenght.self)
    
    let toMeter = converter.convert(100, from: .cm, to: .meter)
    
    #expect(toMeter == 1)
    
    let toCent = converter.convert(1.67 , from : .meter, to :.cm)
    #expect(toCent == 167)
    
    //the line below will cause compile time error cause types (Length and Currency) mismatch
    //let error = converter.convert(123, from: .cm, to: .dollar)
}

@Test func compileTimeError() {
    let currencies : [AnyOfflineCurrency] = [.init(.rial) , .init(.toman)]
    
    let currentToman = Toman.toman
    #expect(currentToman == Toman.toman)
    
    
    let currentRial = Riyal.rial
    #expect(currentRial == Riyal.rial)
    
    
    let anyRiyal = AnyOffline(.rial)
    #expect(.init(currentRial) == anyRiyal)
    
    #expect(currencies[0] != currencies[1])
    #expect(currencies[1] == currencies[1])
    #expect(currencies[0] == currencies[0])
}

@Test func dateTests() async throws {
    let date = DateComponents(calendar:persianCalander,year:1403,month:11,day:30,hour:17).date!
    #expect(date.isIn(11) == true)
    
    let firstOfShahrivar = DateComponents(calendar:persianCalander,year:1403,month:6,day:1).date!
    let lastOfBahman = DateComponents(calendar:persianCalander,year:1403,month:12,day:1).date!
    
    let isInSameDay = persianCalander.isDate(firstOfShahrivar, inSameDayAs: PersianMonths.shahrivar.startDate)
    #expect(isInSameDay)
    
    let isInSameDay2 = persianCalander.isDate(lastOfBahman, inSameDayAs: PersianMonths.bahman.endDate)
    #expect(isInSameDay2)
    
}



@Test func dataBaseSimulation() async throws {
    
    let pallet = SerializedUnit(name: "Pallet", typeName: Numerable.name, ratio: 40, shortSymbol: "pallet", longSymbol: "Pallet")
    let pallet2 = SerializedUnit(name: "Pallet2", typeName: Numerable.name, ratio: 20, shortSymbol: "pallet2", longSymbol: "Pallet2")
    let kilo = KiloGram().serializedUnit
    
    let converter2 = Converter(type: Numerable.self)
    
    let converter = ConverterBuilder.NumberableConverter()
    
    let converted = try  converter.convert(80, from: .one, to: pallet)
    #expect(converted == 2)
    
    #expect(throws: (any Error).self){
        try  converter.convert(86, from: .one, to: kilo)
        
    }
    
    //this line will produce compile-time error
    //let converted = try  converter.convert(86, from: .kg, to: pallet)
    
    let convertToSmallerPallet = try 1.convert(pallet, to: pallet2)
    #expect(convertToSmallerPallet == 2)
    
    
    #expect(throws: (any Error).self){
        let converted = try  converter.convert(86, from: kilo, to: pallet)
        print(converted)
    }

    let converted2 = try converter2.convert(1, from: pallet, to: pallet2)
    #expect(converted2 == 2)
    let converted3 = try converter2.convert(1, from: pallet2, to: .one)
    #expect(converted3 == 20.0)
}
