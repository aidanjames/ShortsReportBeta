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
    
    
    func shortDateString() -> String {
        let formatter = DateFormatter()
//        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
}
