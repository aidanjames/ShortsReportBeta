//
//  HourlyWeatherView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 25/06/2020.
//

import SwiftUI

struct HourlyWeatherView: View {
    let timeOfDay: TimeOfDay
    let temp: Double
    let feelsLikeTemp: Double
    let rain: Double?
    let icon: String
    
    var body: some View {
        VStack {
            Text("\(timeOfDay == .afternoon ? "This afternoon" : "This evening")")
            HStack {
                Image(icon)
                Text("\(temp.kelvinAsCelciusString())").fontWeight(.heavy)
            }
            Text(ViewModel.getShortsStatus(feelsLike: feelsLikeTemp, rain: rain).rawValue)
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .background(Colors.primary.opacity(0.5))
        .cornerRadius(16)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(timeOfDay: .afternoon, temp: 301.86, feelsLikeTemp: 285.4, rain: 5.7, icon: "03d")
    }
}
