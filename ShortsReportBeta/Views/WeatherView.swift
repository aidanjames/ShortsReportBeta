//
//  WeatherView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: ViewModel
    let timeOfDay = Date().timeOfDay()
    
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
                
                
                if timeOfDay != .night {
                    
                    HStack {
                        if timeOfDay == .morning {
                            // show hour view for 15:00
                            if let afternoonWeather = viewModel.weather?.hourly.first(where: { Date(timeIntervalSince1970: $0.id).hourOfDay() == 15 } ) {
                                HourlyWeatherView(timeOfDay: .afternoon, temp: afternoonWeather.temp, feelsLikeTemp: afternoonWeather.feelsLike, rain: afternoonWeather.rain?.oneHr, icon: afternoonWeather.firstWeatherUnwrapped.icon)

                            }

                        }
                        // Show hour view for 19:00
                        if let eveningWeather = viewModel.weather?.hourly.first(where: { Date(timeIntervalSince1970: $0.id).hourOfDay() == 19 } ) {
                            HourlyWeatherView(timeOfDay: .night, temp: eveningWeather.temp, feelsLikeTemp: eveningWeather.feelsLike, rain: eveningWeather.rain?.oneHr, icon: eveningWeather.firstWeatherUnwrapped.icon)

                        }
                    }

                }

                Text("How about the next few days...").padding(.top)
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
        WeatherView(viewModel: MockData.mockViewModel())
    }
}



