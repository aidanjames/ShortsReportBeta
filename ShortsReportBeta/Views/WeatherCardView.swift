//
//  WeatherCardView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct WeatherCardView: View {
    
    var currentWeather: OneCallWeather?
    var shortsImage: Image
    var shortsStatus: String
    var shortsRating: Int
    
    var body: some View {
        VStack {
            Text("Right now")
            HStack {
                    VStack {
                        HStack {
                            Image("\(currentWeather?.current.firstWeatherUnwrapped.icon ?? "50d")")
                            Text("\((currentWeather?.current.temp ?? 0).kelvinAsCelciusString())").font(.largeTitle).bold().frame(width: 100)

                        }
                        Text("Feels like: \((currentWeather?.current.feelsLike ?? 0).kelvinAsCelciusString())").font(.caption)
                            .foregroundColor(.secondary)
                        if let rain = currentWeather?.current.rain?.oneHr {
                            Text("It's raining ☹️ \(rain)").font(.caption).foregroundColor(.secondary)
                        }

                    }
                    shortsImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            
            ShortsRatingView(shortsRating: shortsRating)
        }
        .padding()
        .background(Colors.primary.opacity(0.5))
        .cornerRadius(20)
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherCardView(currentWeather: MockData.weatherPreviewData(), shortsImage: Image("shorts1"), shortsStatus: "Shorts ON!", shortsRating: 4)
                .previewLayout(.sizeThatFits)
        }
    }
}

