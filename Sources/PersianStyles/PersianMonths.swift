//
//  PersianMonths.swift
//  PersianStyles
//
//  Created by MohammavDev on 2/2/25.
//
import Foundation

public enum PersianMonths : String ,Sendable,Equatable, CaseIterable, Identifiable, CustomStringConvertible {
    public var description: String{
        self.rawValue
    }
    
    public var id : Int { self.number}
    case farvardin = "فروردین"
    case ordibehesht = "اردیبهشت"
    case khordad = "خرداد"
    case tir = "تیر"
    case mordad = "مرداد"
    case shahrivar = "شهریور"
    case mehr = "مهر"
  
    case aban = "آبان"
  
    case azar = "آذر"
    case dey = "دی"
    case bahman = "بهمن"
    case esfand = "اسفند"
    
    public init(_ date : Date){
        self = date.currentMonth
    }
    
    public init?(number : Int){
        let chosen = Self.allCases.first { month in
            month.number == number
        }
        guard let chosen else { return nil }
        self = chosen
    }
    public var monthRange : Range<Date> {
        let startDate = persianCalander.date(bySetting: .month, value: self.number, of: Date())!
        let daysInMonth = persianCalander.range(of: .day, in: .month, for: startDate)
        
        //this referes to the day after the end of month
        let endMonthDate = persianCalander.date(byAdding: .day, value: daysInMonth!.count , to: startDate)!
        
        return startDate..<endMonthDate
        
        
    }
    
    
    public var daysRange : Range<Int> {
       persianCalander.range(of: .day, in: .month, for: self.startDate)!
    }
 
    public var startDate : Date {
        Date().startOf(self)
    }
    
    /// - Warning: Beware that endOf month actualy returns the startOf(nextMonth) and you should always compare it like `date < endOf(month)`
    public var endDate : Date{
        Date().endOf(self)
    }
    public var number : Int {
        switch self {
            
        case .farvardin:
            return 1
        case .ordibehesht:
            return 2
        case .khordad:
            return 3
        case .tir:
            return 4
        case .mordad:
            return 5
        case .shahrivar:
            return 6
        case .mehr:
            return 7
        case .aban:
            return 8
        case .azar:
            return 9
        case .dey:
            return 10
        case .bahman:
            return 11
        case .esfand:
            return 12
        }
    }
}
public extension PersianMonths{
    static func == (lhs: PersianMonths, rhs: PersianMonths) -> Bool {
        return lhs.number == rhs.number
    }
}
public extension Date {
     func isIn(_ persianMonth: PersianMonths) -> Bool {
        return persianMonth.monthRange.contains(self)
    }
    func startOf(_ persianMonth:PersianMonths) -> Date {
        let startDate = DateComponents(calendar:persianCalander,year: self.currentYear,month:persianMonth.number,day: 1).date!
        return startDate
    }
    var nextPersianDay : Date {
        let startOfDay = persianCalander.date(bySettingHour: 0, minute: 0, second: 0, of: self)
        let nextDay = persianCalander.date(byAdding: .day, value: 1, to: startOfDay!)!
        return nextDay
    }
    /// - Warning: Beware that endOf month actualy returns the startOf(nextMonth) and you should always compare it like `date < endOf(month)`
    func endOf(_ persianMonth:PersianMonths) -> Date {
        if persianMonth == .esfand {
            let nextMonth = PersianMonths(number: 1)!
            let year = self.currentYear + 1
            let date = DateComponents(calendar: persianCalander, year: year, month: nextMonth.number,day: 1).date
            return date!
        }else{
            let nextMonthNumber = persianMonth.number + 1
            let nextMonthStart = startOf(PersianMonths(number:nextMonthNumber)!)
            return nextMonthStart
        }
    }
    var currentMonth : PersianMonths {
        let month = persianCalander.dateComponents([.month], from: self).month!
        return PersianMonths(number: month)!
    }
}
extension PersianMonths : ExpressibleByIntegerLiteral {
    /// - Warning: This initializer will throw fatalError if you number is not between 1...12 !
    public init(integerLiteral value: Int) {
        guard value >= 1 && value <= 12 else {
            
            fatalError("Number must be between 1 and 12, but given \(value).")
        }
        self = .init(number: value)!
    }
    
    public typealias IntegerLiteralType = Int
    
    
}
