//
//  DateFormatter.swift
//  PersianStyles
//
//  Created by MohammavDev on 8/11/24.
//

import Foundation

public let persianCalander : Calendar = {
    var calendar = Calendar(identifier: .persian)
    calendar.locale = .init(identifier: "fa_IR")
    
    return calendar
}()

public let persianFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.calendar = persianCalander
    
    formatter.locale = .init(identifier: "fa_IR")
    formatter.dateFormat = "yyyy/MM/dd - HH:mm:ss"
    return formatter
}()

public let daysago : Date! = persianCalander.date(byAdding: .day, value: -3, to: Date())
public let monthsago : Date! = persianCalander.date(byAdding: .month, value: -2, to: Date())
public let yearsago  : Date! = persianCalander.date(byAdding: .year, value: -5, to: Date())

public let persianDateFormatter : DateFormatter = {
    var formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .none
    formatter.doesRelativeDateFormatting = true
    formatter.locale = Locale(languageCode: Locale.LanguageCode.persian)
    
    
    return formatter
}()

public let fullDateFormatter : DateFormatter = {
    
    var formatter = DateFormatter()
    formatter.dateFormat = "MM/dd - HH:mm"
    formatter.locale = Locale(identifier: "fa_IR")
    formatter.calendar = persianCalander
    return formatter
    
}()

public extension Date {
    
    var  inPersionFormat : String {
        return persianFormatter.string(from: self)
    }
    
    var inPersianShortFormat : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.locale = Locale(identifier: "fa_IR")
        
        return formatter.string(from: self)
    }
    
}

public extension Date {
    
    static var currentYear : Int{
        
        return persianCalander.component(.year, from: Date())
        
    }
    
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
    
    static var thisYearRange : ClosedRange<Date> {
        let dateRange: ClosedRange<Date> = {
            let calendar = persianCalander
            let currentYear = calendar.dateComponents([.year], from: Date())
            let year = currentYear.year!
            
            var startComponents = DateComponents(year: year, month: 1, day: 1)
            
            startComponents.calendar  = calendar
            
            var endComponents = DateComponents(year: year + 1, month: 1, day: 1, hour: 0, minute: 0, second: 0)
             endComponents.calendar  = calendar
            var date = endComponents.date!
            
            date = persianCalander.date(byAdding: .second, value: -1, to: date)!

            endComponents = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
            
            endComponents.calendar  = calendar
            
            let range = startComponents.date!...Date()
            
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
