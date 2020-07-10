//
//  CurrentWeather.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 05/07/2020.
//

import SwiftUI

struct CurrentWeather: View {
    
    var shortsStatus: ShortsStatus = .definitely
    var currentWeather: OneCallWeather
    @State private var bottomSheetOpen = false
    
    
    var body: some View {
        VStack {
            Text("Current shorts status: \(shortsStatus.rawValue)")
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
                .padding(.bottom, 10)
                .background(Colors.primary)
            HStack {
                VStack(alignment: .leading) {
                    Text("\(currentWeather.current.temp.kelvinAsCelciusString())")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Text("Feels like: \(currentWeather.current.feelsLike.kelvinAsCelciusString())")
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Image(currentWeather.current.firstWeatherUnwrapped.icon)
                }
                Spacer()

            }
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
        .edgesIgnoringSafeArea(.all)

    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather(currentWeather: MockData.weatherPreviewData())
    }
}
