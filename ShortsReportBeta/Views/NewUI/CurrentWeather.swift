//
//  CurrentWeather.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 05/07/2020.
//

import SwiftUI

struct CurrentWeather: View {
    
    var currentWeather: OneCallWeather
    @State private var bottomSheetOpen = false
    
    
    var body: some View {
        VStack {
            
            WeatherRibbonView(currentWeather: currentWeather)
                .edgesIgnoringSafeArea(.top)
            
            
            
            Image("shorts1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            ShortsRatingView(shortsRating: 3)
                .frame(maxWidth: 250)
            
            Spacer()
            
            BottomSheetView(isOpen: $bottomSheetOpen, maxHeight: 380) {
                Text("Rest of the week")
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                    .background(Colors.secondary)
            }
            
        }
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather(currentWeather: MockData.weatherPreviewData())
    }
}

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
        .background(Color.red.opacity(0.5))
    }
}
