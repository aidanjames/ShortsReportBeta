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
    let feelsLikeTemp: Double
    let rain: Double?
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Date(timeIntervalSince1970: date).dayOfWeekString()).bold()
            HStack {
                Image(icon)
                Text("\(temp.kelvinAsCelciusString())°C").fontWeight(.heavy).padding(.trailing)
            }
            Text("\(ViewModel.getShortsStatus(feelsLike: feelsLikeTemp, rain: rain).rawValue)").bold()
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .background(Colors.primary.opacity(0.5))
        .cornerRadius(16)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(date: 1593115200.0, temp: 301.86, feelsLikeTemp: 289.41, rain: 3.5, icon: "03d")
    }
}
