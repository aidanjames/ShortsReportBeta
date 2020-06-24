//
//  WeatherCardView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct WeatherCardView: View {
    
    var currentWeather: OneCallWeather?
    var locationName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("\(locationName)").fontWeight(.black)
                }
                HStack {
                    Text("\((currentWeather?.current.temp ?? 0).kelvinAsCelciusString())°").font(.largeTitle).bold()
                    Text("Feels like: \((currentWeather?.current.feelsLike ?? 0).kelvinAsCelciusString())°").font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            HStack {
                VStack {
                    Image("\(currentWeather?.current.firstWeatherUnwrapped.icon ?? "50d")")
                }
            }
        }
        .padding()
        .background(Color(hex: "b1b493").opacity(0.5))
        .cornerRadius(20)
    }
}

//struct WeatherCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCardView(currentWeather: MockData.previewData())
//            .previewLayout(.sizeThatFits)
//    }
//}

