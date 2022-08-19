//
//  DateTimeConverterClass.swift
//  iOSDateTimeConverter
//
//  Created by Prajakta Kiran Patil on 18/08/22.
//

import Foundation

public class dateAndTimeConverterClass {
    
    public func getFormattedDate(serverTime: String, fromFormat: String , isWithMilliSeconds: Bool = false, toFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        let serverDate = formatter.date(from: serverTime)
        formatter.dateFormat = toFormat
        if let date = serverDate {
            let internationalTime = formatter.string(from: date)
            return internationalTime
        }
        else {
            return ""
        }
    }


    public func convertUTCToLocalDate(serverTime: String, fromFormat: String , isWithMilliSeconds: Bool = false, toFormat: String) -> String {
        
    let formatter = DateFormatter()
    formatter.dateFormat = fromFormat
    
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    let serverDate = formatter.date(from: serverTime)
    formatter.timeZone = TimeZone.current
    //let serverDate = formatter.date(from: serverTime)
    formatter.dateFormat = toFormat
    if let date = serverDate {
        let localTime = formatter.string(from: date)
        return localTime
    }
    else {
        return ""
    }
    }
    
    public func convertLocalToUTCDate(serverTime: String, fromFormat: String , isWithMilliSeconds: Bool = false, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        if let date = dateFormatter.date(from: serverTime) {
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.dateFormat = toFormat
        
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    public func getCurrentDateAndTime() -> String {
        let currentDateTime = Date()

        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long

        // get the date time String from the date object
      return formatter.string(from: currentDateTime)
        
    }
    
    public func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(hour):\(minutes)"
    }
    
    public func getSpecificDate(byAdding component: Calendar.Component, value: Int) -> Date {

        let noon = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!

        return Calendar.current.date(byAdding: component, value: value, to: noon)!
    }
   
    
}

public extension Date {
    
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }

}

