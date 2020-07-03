//
//  WeatherView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: ViewModel
       
    var body: some View {
        VStack {
                
            HStack {
                LocationView(location: viewModel.lastKnownTown)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
            }
            
            if let weather = viewModel.weather {
                WeatherCardView(currentWeather: weather, shortsImage: viewModel.shortsImage, shortsStatus: viewModel.canWearShorts.rawValue)
                    .padding(.horizontal)
                
                
                Spacer()
                
                Text("The next 6 hours...")
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        // I'm deliberately skipping the first in the array as it's the current hour which is already reported above.
                        ForEach(1..<7) { index in
                            let hourWeather = weather.hourly[index]
                            HourlyWeatherView(date: hourWeather.id, temp: hourWeather.temp, feelsLikeTemp: hourWeather.feelsLike, rain: hourWeather.rain?.oneHr, icon: hourWeather.firstWeatherUnwrapped.icon)
                        }
                    }
                }
                .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("The next week...")
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        // I'm deliberately skipping the first in the array as it's the current day which is already reported above.
                        ForEach(1..<weather.daily.count) { index in
                            let dailyWeather = weather.daily[index]
                            DailyWeatherView(date: dailyWeather.id, temp: dailyWeather.temp.max, feelsLikeTemp: dailyWeather.feelsLike.day, rain: dailyWeather.rain, icon: dailyWeather.firstWeatherUnwrapped.icon)
                        }
                    }
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                
                Spacer()
            }
            

        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: ViewModel())
    }
}



