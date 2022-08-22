//
//  DateTimeConverterClass.swift
//  iOSDateTimeConverter
//
//  Created by Prajakta Kiran Patil on 18/08/22.
//

import Foundation
// Date and time converter and all operations.
public class DateAndTimeConverterClass {
    
    public init() {
        
    }
    
    /**
        Date conerter format call `getFormattedDate`
     
     - Parameter serverTime: server date
     - Parameter fromFormat: server date format
     - Parameter toFormat: format in which convert
     - Returns: converted format string`internationalTime`.
     
    */
    
    public func getFormattedDate(serverTime: String, fromFormat: String , toFormat: String) -> String {
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
    
    /**
        get current date  `getCurrentDate`
     
     - Returns: current date string`dateString`.
     
    */
    
    public func getCurrentDate() -> String {
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: now)
        return dateString
        
    }
    
    
    /**
        get UTC to local date  `convertUTCToLocalDate`
     - Parameter serverTime: server date
     - Parameter fromFormat: server date format
     
     - Returns: local date string `localTime`.
     
    */
    
    public func convertUTCToLocalDate(serverTime: String, fromFormat: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let serverDate = formatter.date(from: serverTime)
        formatter.timeZone = TimeZone.current
        //let serverDate = formatter.date(from: serverTime)
            // formatter.dateFormat = toFormat
        if let date = serverDate {
            let localTime = formatter.string(from: date)
            return localTime
        }
        else {
            return ""
        }
    }
    
    /**
        get local to UTC date  `convertLocalToUTCDate`
     - Parameter serverTime: server date
     - Parameter fromFormat: server date format
     
     - Returns: UTC date string `date`.
     
    */
    
    public func convertLocalToUTCDate(serverTime: String, fromFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        if let date = dateFormatter.date(from: serverTime) {
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
           // dateFormatter.dateFormat = toFormat
            
            return dateFormatter.string(from: date)
        }
        return ""
    }
    

    
    /**
        get local to UTC date  `getCurrentTime`
     
     - Returns: current time `hour`:`minutes`.
     
    */
    
    public func getCurrentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        return "\(hour):\(minutes)"
    }
    

    /**
        get current year  `getCurrentYear`
     
     - Returns: current year
     
    */
    
    public func getCurrentYear() -> Int{
        return Calendar.current.component(.year, from: Date())
    }
    
    /**
        get current month  `getCurrentMonth`
     
     - Returns: current month
     
    */
    
    public func getCurrentMonth() -> Int{
        return Calendar.current.component(.month, from: Date())
    }
    
    /**
        get current month  `getCurrentDay`
     
     - Returns: current day
     
    */
    
    
    public func getCurrentDay() -> Int{
        return Calendar.current.component(.day, from: Date())
    }
    
    /**
        get current month  `getYearFromDate`
     
     - Parameter date: your date
     
     - Returns:  Int `year`.
     
    */
    
    public func getYearFromDate(date: Date) -> Int{
        let year = Calendar.current.dateComponents([.year], from: date)
        return (year.year!)
    }
    
    /**
        convert date to string  `getDateFromString`
     
     - Parameter stringDate: your date in string format
     - Parameter format: stringDate format
     
     
     - Returns:  returns `stringDate` in date fromat.
     
    */
    
    
    public func getDateFromString(stringDate: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: stringDate)
    }
    
    
    /**
        convert string to date  `getStringFromDate`
     
     - Parameter date: your date
     - Parameter format: date format
     
     
     - Returns:  returns `stringDate` string format.
     
    */
    
    
    public func getStringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let strDate = formatter.string(from: date)
        return strDate
    }
    
    
    /**
        get timestamp from date  `getTimestampFromDate`
     
     - Parameter date: your date
     - Returns:  returns `miliSeconds` in Int64.
     
    */
    
    
    public func getTimestampFromDate(date: Date) -> Int64 {
        let miliSeconds = date.timeIntervalSince1970
        return Int64(Int(miliSeconds*1000))
    }
    
    /**
        get  age  `getAge`
     
     - Parameter birthDate: your birth date
     - Returns: `orderedSame` if current date and birthdate is same.
     - Returns: `orderedAscending` as your age.
     - Returns: `orderedDescending` if birthdate is wrong.
     
    */
    
    
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
    
    /**
        date comparison  `compareDates`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `orderedSame` The two dates are same.
     - Returns: `orderedAscending` Date1 is earlier than date2.
     - Returns: `orderedDescending` Date1 is later than date2.
     
    */
    
    
    public func compareDates(date1: Date, date2: Date) -> String {
        switch date1.compare(date2){
        case .orderedSame: return "The two dates are same"
        case .orderedAscending: return "Date1 is earlier than date2"
        case .orderedDescending: return "Date1 is later than date2"
        default:
            return "Sorry! Can't compare"
        }
    }
    
    
    
    /**
        Get Difference Between Two Dates In Days  `getDifferenceBetweenTwoDatesInDays`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `days.day` Difference Between Two Dates In Days.
     
    */
    
    
    public func getDifferenceBetweenTwoDatesInDays(date1: Date, date2: Date) -> Int {
        let days = Calendar.current.dateComponents([.day], from: date1, to: date2)
        return days.day ?? 0
    }
    
    
    /**
        Get Difference Between Two Dates In Days  `getDifferenceBetweenTwoDatesInMonths`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `days.month` Difference Between Two Dates In months.
     
    */
    
    public func getDifferenceBetweenTwoDatesInMonths(date1: Date, date2: Date) -> Int{
        let months = Calendar.current.dateComponents([.month], from: date1, to: date2)
        return months.month ?? 0
    }
    
    /**
        Get Difference Between Two Dates In Days  `getDifferenceBetweenTwoDatesInYears`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `days.year` Difference Between Two Dates In years.
     
    */
    
    
    public func getDifferenceBetweenTwoDatesInYears(date1: Date, date2: Date) -> Int{
        let years = Calendar.current.dateComponents([.year], from: date1, to: date2)
        return years.year ?? 0
    }
    
    /**
        Get Difference Between Two Dates In hour  `getDifferenceBetweenTwoDatesInHours`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `days.year` Difference Between Two Dates In hours.
     
    */
    
    public func getDifferenceBetweenTwoDatesInHours(date1: Date, date2: Date) -> Int{
        let hours = Calendar.current.dateComponents([.hour], from: date1, to: date2)
        return hours.hour ?? 0
    }
    
    
    /**
        Get Difference Between Two Dates In minutes  `getDifferenceBetweenTwoDatesInMinutes`
     
     - Parameter date1: first date
     - Parameter date2: second date
     - Returns: `days.year` Difference Between Two Dates In mintutes.
     
    */
    
    public func getDifferenceBetweenTwoDatesInMinutes(date1: Date, date2: Date) -> Int{
        let minutes = Calendar.current.dateComponents([.minute], from: date1, to: date2)
        return minutes.minute ?? 0
    }
    
    /**
        add number of days into date  `addNumberOfDaysToDate`
     
     - Parameter date: your date.
     - Parameter count: number of days.
     - Returns: `date` added of days.
     
    */
    
    public func addNumberOfDaysToDate(date: Date, count: Int) -> Date{
        let newComponent = DateComponents(day: count)
        guard let newDate = Calendar.current.date(byAdding: newComponent, to: date) else {
            return date
        }
        return newDate
    }
    
    /**
        check if it is today  `isToday`
     
     - Parameter date: your date.
     - Returns: if it is today will retrun true else false.
     
    */
    
    public func isToday(date: Date) -> Bool{
        let today = Calendar.current.component(.day, from: Date())
        let dayToCompare = Calendar.current.component(.day, from: date)
        return today == dayToCompare
    }
    
    /**
        check if it is weekend  `isWeekEnd`
     
     - Parameter date: your date.
     - Returns: if it is weekend will retrun true else false.
     
    */
    
    public func isWeekEnd(date: Date) -> Bool{
        return Calendar.current.isDateInWeekend(date)
    }
    
    
    /**
        get current time zone  `getCurrentTimeZone`
     
     - Returns: will return `TimeZone`.
     
    */
    
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

