//
//  DailyWeatherView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 26/06/2020.
//

import SwiftUI

struct DailyWeatherView: View {
    let date: Double
    let temp: Double
    
    var body: some View {
        VStack {
            Text(Date(timeIntervalSince1970: date).shortDateAndTimeString())
            Text("\(temp.kelvinAsCelciusString())°C").fontWeight(.heavy)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .background(Colors.primary.opacity(0.5))
        .cornerRadius(16)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(date: 1593115200.0, temp: 301.86)
    }
}
