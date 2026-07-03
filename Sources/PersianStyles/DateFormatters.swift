//
//  DateFormatter.swift
//  PersianStyles
//
//  Created by MohammavDev on 8/11/24.
//

import Foundation


public extension Calendar {
    static var currentPersianYear : Int{
      
      return persianCalander.component(.year, from: Date())
      
  }
}

public let persianCalander : Calendar = {
    var calendar = Calendar(identifier: .persian)
    calendar.locale = .init(identifier: "fa_IR")
    
    return calendar
}()

///Formater with "yyyy/MM/dd - HH:mm:ss" format in perisan calendar and locale
public let persianFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.calendar = persianCalander
    
    formatter.locale = .init(identifier: "fa_IR")
    formatter.dateFormat = "yyyy/MM/dd - HH:mm:ss"
    return formatter
}()

public let daysago : Date = persianCalander.date(byAdding: .day, value: -3, to: Date())!
public let monthsago : Date = persianCalander.date(byAdding: .month, value: -2, to: Date())!
public let yearsago  : Date = persianCalander.date(byAdding: .year, value: -5, to: Date())!

public let persianDateFormatter : DateFormatter = {
    var formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    formatter.doesRelativeDateFormatting = true
    formatter.locale = Locale(languageCode: Locale.LanguageCode.persian)
    
    
    return formatter
}()

///Formatter with "MM/dd - HH:mm" format with persian calendar and locale
public let fullDateFormatter : DateFormatter = {
    
    var formatter = DateFormatter()
    formatter.dateFormat = "MM/dd - HH:mm"
    formatter.locale = Locale(identifier: "fa_IR")
    formatter.calendar = persianCalander
    return formatter
    
}()

public extension Date {
    
    ///Perisan year for this date
    var persianYear : Int {
        persianCalander.component(.year, from: self)
    }
    ///Formater with "yyyy/MM/dd - HH:mm:ss" format in perisan calendar and locale
    var  inPersionFormat : String {
        return persianFormatter.string(from: self)
    }
    
    ///perisan standard format : yyyy/MM/dd
    var inPersianShortFormat : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale(identifier: "fa_IR")
        
        return formatter.string(from: self)
    }
    
}

public extension Date {
    
   
    
    func randomizeDailyHours(calendar : Calendar = persianCalander) -> Date {
        var resultDate : Date
        let hour = Int.random(in: 7 ... 23)
        let minute = Int.random(in: 0 ... 59)
        let seconds = Int.random(in: 0 ... 59)
        
        resultDate = calendar.date(bySetting: .hour, value: hour, of: self)!
        resultDate = calendar.date(bySetting: .minute, value: minute, of: resultDate)!
        resultDate = calendar.date(bySetting: .second, value: seconds, of: resultDate)!
        return resultDate
    }
    func randomizeMintutes(calendar : Calendar = persianCalander) -> Date {
        var resultDate : Date
        
        let minute = Int.random(in: 0 ... 59)
        let seconds = Int.random(in: 0 ... 59)
        
        resultDate = calendar.date(bySetting: .minute, value: minute, of: self)!
        resultDate = calendar.date(bySetting: .second, value: seconds, of: resultDate)!
        return resultDate
    }
}
public extension Date {
    
      var thisYearRange : Range<Date> {
        let dateRange: Range<Date> = {
            let calendar = persianCalander
            
            let year = self.persianYear
            
            let startComponents = DateComponents(calendar: calendar,year: year, month: 1, day: 1)
            let endComponents = DateComponents(calendar:calendar,year: year + 1, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        
            let endDate = endComponents.date!
            
            let range = startComponents.date!..<endDate
            
            return range
                
        }()
        
        return dateRange
    }
}

public extension Date {
    
    var relativePersianString: String {
        
       let formatter =  RelativeDateTimeFormatter()
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.calendar = persianCalander
        formatter.formattingContext = .standalone
        formatter.dateTimeStyle = .named
            
        return formatter.localizedString(for: self, relativeTo: .now)
       
    }
    
    
}
