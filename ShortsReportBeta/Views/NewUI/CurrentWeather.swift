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


