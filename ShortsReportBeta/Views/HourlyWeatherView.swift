//
//  HourlyWeatherView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 25/06/2020.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    let date: Double
    let temp: Double
    
    var body: some View {
        VStack {
            Text(Date(timeIntervalSince1970: date).shortDateString())
            Text("\(temp.kelvinAsCelciusString())° C")
        }
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(date: 1593115200.0, temp: 301.86)
    }
}
