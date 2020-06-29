//
//  Constants.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

enum API {
    static let key = "012583e4f70d9bb3a88dccaba58090ca"
    static let url = "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=minutely&appid=\(API.key)"
    
//    https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=minutely&appid=012583e4f70d9bb3a88dccaba58090ca
}

enum DefaultsKeys {
    static let date = "date"
}

enum SFSymbols {
    static let mapAndPin = "mappin.and.ellipse"
}

enum Colors {
    static let primary = Color(hex: "b1b493")
    static let secondary = Color(hex: "ffcb74")
}
