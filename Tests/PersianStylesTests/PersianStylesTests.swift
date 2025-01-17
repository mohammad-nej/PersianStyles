import Testing
@testable import PersianStyles

@Test func currencyCovnerter() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    
    let manager = Converter()
    
        let notEffect =  try await manager.convert(8450_000,from: .dollar, to : .dollar , in: .now)
    #expect(notEffect == 8450_000)
    
    let toman =   manager.convert(10_000.0, from: .rial, to: .toman)
    #expect(toman == 1000.0)
    
    let dollar =  try await manager.convert(800_000,from: .rial, to : .dollar , in: .now)
    #expect(dollar == 1)
    
    let toman2 = try await manager.convert(35, from: .dollar, to: .toman,in:.now)
    #expect(toman2 == Double(35 * 80_000))
    
    let converted = try await 90000.0.convert(.rial, to: .dollar)
   
}
@Test func lengthConverter() async throws {
    let converter = Converter(type: Lenght.self)
    
    let toMeter = converter.convert(100, from: .cm, to: .meter)
    
    #expect(toMeter == 1)
    
    let toCent = converter.convert(1.67 , from : .meter, to :.cm)
    #expect(toCent == 167)
    
  
    
    //the line below will cause compile time error cause types (Lenght and Currency) mismatch
    //let error = converter.convert(123, from: .cm, to: .dollar)
}

