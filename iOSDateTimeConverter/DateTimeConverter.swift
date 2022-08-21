//
//  DateTimeConverterClass.swift
//  iOSDateTimeConverter
//
//  Created by Prajakta Kiran Patil on 18/08/22.
//

import Foundation

public class DateAndTimeConverterClass {
    
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
    
    public func getCurrentYear() -> Int{
        return Calendar.current.component(.year, from: Date())
    }
    
    public func getCurrentMonth() -> Int{
        return Calendar.current.component(.month, from: Date())
    }
    
    public func getCurrentDay() -> Int{
        return Calendar.current.component(.day, from: Date())
    }
    
    public func getYearFromDate(date: Date) -> Int{
        let year = Calendar.current.dateComponents([.year], from: date)
        return (year.year!)
    }
    
    public func getDateFromString(stringDate: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: stringDate)
    }
    
    
    public func getStringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let strDate = formatter.string(from: date)
        return strDate
    }
    
    
    public func getTimestampFromDate(date: Date) -> Int64 {
        let miliSeconds = date.timeIntervalSince1970
        return Int64(Int(miliSeconds*1000))
    }
    
    public func getAge(birthDate: Date) -> Int? {
        switch birthDate.compare(Date()) {
        case .orderedSame: return 0
        case .orderedAscending:
            let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date())
            return age.year
        case .orderedDescending: return nil
        default:
            return 0
        }
    }
    
    public func compareDates(date1: Date, date2: Date) -> String {
        switch date1.compare(date2){
        case .orderedSame: return "The two dates are same"
        case .orderedAscending: return "Date1 is earlier than date2"
        case .orderedDescending: return "Date1 is later than date2"
        default:
            return "Sorry! Can't compare"
        }
    }
    
    
    public func getDifferenceBetweenTwoDatesInDays(date1: Date, date2: Date) -> Int {
        let days = Calendar.current.dateComponents([.day], from: date1, to: date2)
        return days.day ?? 0
    }
    
    public func getDifferenceBetweenTwoDatesInMonths(date1: Date, date2: Date) -> Int{
        let months = Calendar.current.dateComponents([.month], from: date1, to: date2)
        return months.month ?? 0
    }
    
    public func getDifferenceBetweenTwoDatesInYears(date1: Date, date2: Date) -> Int{
        let years = Calendar.current.dateComponents([.year], from: date1, to: date2)
        return years.year ?? 0
    }
    
    public func getDifferenceBetweenTwoDatesInHours(date1: Date, date2: Date) -> Int{
        let hours = Calendar.current.dateComponents([.hour], from: date1, to: date2)
        return hours.hour ?? 0
    }
    
    public func getDifferenceBetweenTwoDatesInMinutes(date1: Date, date2: Date) -> Int{
        let minutes = Calendar.current.dateComponents([.minute], from: date1, to: date2)
        return minutes.minute ?? 0
    }
    
    public func addNumberOfDaysToDate(date: Date, count: Int) -> Date{
        let newComponent = DateComponents(day: count)
        guard let newDate = Calendar.current.date(byAdding: newComponent, to: date) else {
            return date
        }
        return newDate
    }
    
    public func isToday(date: Date) -> Bool{
        let today = Calendar.current.component(.day, from: Date())
        let dayToCompare = Calendar.current.component(.day, from: date)
        return today == dayToCompare
    }
    
    public func isWeekEnd(date: Date) -> Bool{
        return Calendar.current.isDateInWeekend(date)
    }
    
    public func getCurrentTimeZone() -> TimeZone{
        return TimeZone.current
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

