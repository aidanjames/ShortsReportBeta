//
//  Date+Ext.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import Foundation

extension Date {
        
    func minutesBetweenDates() -> Double {

        //get both times sinces refrenced date and divide by 60 to get minutes
        let newDateMinutes = Date().timeIntervalSinceReferenceDate/60
        let oldDateMinutes = self.timeIntervalSinceReferenceDate/60

        //then return the difference
        return newDateMinutes - oldDateMinutes
    }
    
    
    func shortTimeString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
    
    func shortDateAndTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
    
    func dayOfWeekString() -> String {
        let number = Calendar.current.dateComponents([.weekday], from: self).weekday
        switch number {
        case 1:
            return "Sun"
        case 2:
            return "Mon"
        case 3:
            return "Tue"
        case 4:
            return "Wed"
        case 5:
            return "Thu"
        case 6:
            return "Fri"
        default:
            return "Sat"
        }
    }
    
    
    func hourOfDay() -> Int { Calendar.current.component(.hour, from: self) }
    
    
    func timeOfDay() -> TimeOfDay {
        let hour = self.hourOfDay()
        
        if hour <= 12 {
            return .morning
        } else if hour > 12 && hour <= 18 {
            return .afternoon
        }
        
        return .night
    }
    
}
