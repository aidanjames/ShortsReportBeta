//
//  ViewModel.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import Foundation
import CoreLocation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var weather: OneCallWeather? //= MockData.weatherPreviewData()
    
    @Published var canWearShorts: ShortsStatus = .analysing {
        didSet {
            guard canWearShorts != .analysing else {
                shortsImage = Image("question")
                return
            }
            if canWearShorts == .onlyShortsProfessionals || canWearShorts == .maybe || canWearShorts == .definitely {
                shortsImage = Image("shorts\(Int.random(in: 1...6))")
            } else {
                shortsImage = Image("pants\(Int.random(in: 1...11))")
            }
        }
    }
    
    @Published var shortsImage: Image = Image("shorts1")
    @Published var showingLoadingAnimation = true
    @Published var showingErrorAlert = false
    @Published var errorAlertMessage = ""
    
    
    // Location variables
    let locationManager = LocationManager()
    
    @Published var currentLocation: CLLocation? {
        didSet {
            guard currentLocation != nil else { return }
            self.fetchCurrentWeather(fromLocation: currentLocation!.coordinate)
            self.updateTownName()
        }
    }
    
    @Published var lastKnownTown: String = "Loading"
    
    
    func updateWeather() {
        self.showingLoadingAnimation = true
        self.currentLocation = nil
        locationManager.start()
        
        locationManager.completion = { location in
            DispatchQueue.main.async {
                self.currentLocation = location
            }
        }
    }
    
    private func updateTownName() {
        guard currentLocation != nil else { return }
        self.locationManager.getPlace(for: self.currentLocation!) { placemark in
            guard let place = placemark else { return }
            if let town = place.subLocality {
                self.lastKnownTown = town
            } else if let city = place.locality {
                self.lastKnownTown = city
            }
        }
    }
    
    
    private func fetchCurrentWeather(fromLocation coordinates: CLLocationCoordinate2D) {
        
        let URL = "https://api.openweathermap.org/data/2.5/onecall?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&exclude=minutely&appid=\(API.key)"
        
        NetworkManager.shared.fetchData(from: URL) { result in
            switch result {
            case .success(let data):
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    self.weather = try decoder.decode(OneCallWeather.self, from: data)
                    print("****** ALL WEATHER ******")
                    print(self.weather!)
                    
                    print("******* HOURLY WEATHER ******")
                    for hourlyWeather in self.weather!.hourly {
                        print(hourlyWeather)
                    }
                    
                    print("******* DAILY WEATHER ******")
                    for dailyWeather in self.weather!.daily {
                        print(dailyWeather)
                    }
                    
                    UserDefaults.standard.set(Date(), forKey: DefaultsKeys.date)
                    self.complicatedAlgorithym()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation { self.showingLoadingAnimation = false }
                    }
                } catch {
                    print("We couldn't parse the data: \(error.localizedDescription)")
                    // Add an alert bool to present an error to the user
                    self.showingErrorAlert = true
                    self.errorAlertMessage = "Could not parse data: \(error.localizedDescription)"
                }
            case .failure(let error):
                print("We couldn't get the data: \(error.localizedDescription)")
                // Add an alert bool to present an error to the user
                self.showingErrorAlert = true
                self.errorAlertMessage = "Could not get data: \(error.localizedDescription)"
            }
        }
    }
    
    
    private func complicatedAlgorithym() {
        guard weather != nil else { return }
               
        // TODO: Change this to use kelvins instead so we don't have to adjust this for celcius/farenheight
        switch weather!.current.feelsLike.kelvinAsCelciusDouble() {
        case ...5 :
            canWearShorts = .absolutelyNot
        case 5...13:
            canWearShorts = .onlyShortsProfessionals
        case 13...16:
            canWearShorts = .maybe
        case 16...:
            canWearShorts = .definitely
        default:
            canWearShorts = .analysing
        }
        
    }
    
    
    func getShortsStatus(feelsLike: Double, rain: Double? = 0, wind: Double) -> ShortsStatus {
        return .analysing
    }
    
}




enum ShortsStatus: String {
    case analysing = "Be patient"
    case definitely = "Shorts ON!"
    case maybe = "Can wear"
    case onlyShortsProfessionals = "Professionals only"
    case absolutelyNot = "No fucking way"
}

