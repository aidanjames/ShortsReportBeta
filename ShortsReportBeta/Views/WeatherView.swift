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
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(weather.hourly) { hourWeather in
                            HourlyWeatherView(date: hourWeather.id, temp: hourWeather.temp)
                        }
                    }
                }
            }
            

        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: ViewModel())
    }
}



