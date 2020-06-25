//
//  ContentView.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.showingLoadingAnimation {
                    LottieView(filename: "loading")
                } else {
                    WeatherView(viewModel: viewModel)
                    Spacer()
                    Button("Get Weather") { self.viewModel.updateWeather() }
                        .padding()
                }
            }
            .navigationBarTitle("Shorts report")
            .onAppear() {
                self.viewModel.updateWeather()
            }
            .alert(isPresented: $viewModel.showingErrorAlert) {
                Alert(title: Text("Oops!"), message: Text(self.viewModel.errorAlertMessage), dismissButton: .cancel(Text("OK")))
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                // Only check the latest weather it's not been updatd in last 10 mins
                if let date = UserDefaults.standard.object(forKey: DefaultsKeys.date) as? Date {
                    guard date.minutesBetweenDates() > 10 else { return }
                    self.viewModel.updateWeather()
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}



