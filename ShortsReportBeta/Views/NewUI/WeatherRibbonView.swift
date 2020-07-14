//
//  WeatherRibbonView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 14/07/2020.
//

import SwiftUI

struct WeatherRibbonView: View {
    
    var currentWeather: OneCallWeather
    
    var body: some View {
        HStack(alignment: .top) {
            Image(currentWeather.current.firstWeatherUnwrapped.icon)
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack {
                Text("\(currentWeather.current.temp.kelvinAsCelciusString())")
                    .font(Font.system(size: 60))
                    .fontWeight(.black)
                Text("Feels like: \(currentWeather.current.feelsLike.kelvinAsCelciusString())")
                    .foregroundColor(.secondary)
                
            }
            Spacer()
        }
        .padding(.top, 50)
        .padding(.bottom, 10)
        .background(Colors.primary.opacity(0.5))
    }
}

struct WeatherRibbonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRibbonView(currentWeather: MockData.weatherPreviewData())
    }
}
