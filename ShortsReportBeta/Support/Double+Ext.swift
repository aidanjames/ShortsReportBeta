//
//  Double+Ext.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import Foundation

extension Double {
    
    func kelvinAsCelciusString() -> String { String(Int(self - 273.15)) + "°" }
    
    
    func kelvinAsFarenheightString() -> String { "TO DO" }
    
    
    func kelvinAsCelciusDouble() -> Double { Double(self - 273.15) }
    
    
    func kelvinAsFarenheightDouble() -> Double { 0 }
    
    
    func timeOfDay() -> TimeOfDay {
        let hour = Date(timeIntervalSince1970: self).hourOfDay()
        
        if hour <= 12 {
            return .morning
        } else if hour < 12 && hour <= 18 {
            return .afternoon
        }
        
        return .night
    }
}


enum TimeOfDay: String {
    case morning
    case afternoon
    case night
}
