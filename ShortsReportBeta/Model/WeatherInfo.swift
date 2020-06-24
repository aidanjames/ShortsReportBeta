//
//  WeatherInfo.swift
//  ShortsReportBeta
//
//  Created by Aidan Pendlebury on 24/06/2020.
//

import CoreLocation
import Foundation


struct OneCallWeather: Codable {
    
    var current: WeatherSituation
    var hourly: [WeatherSituation]
    var daily: [DailyWeatherSituation]
    
    struct WeatherSituation: Codable {
        var dt: Double
        var temp: Double
        var feelsLike: Double
        var humidity: Int
        var windSpeed: Double
        var windDeg: Int
        fileprivate var weather: [Weather]
        
        var firstWeatherUnwrapped: Weather {
            if let first = weather.first {
                return first
            }
            return Weather(main: "Error", description: "Error", icon: "Error")
        }
        
        
    }
    
    struct DailyWeatherSituation: Codable {
        var dt: Double
        var temp: Temperature
        var feelsLike: FeelsLikeTemp
        var humidity: Double
        var windSpeed: Double
        var windDeg: Double
        fileprivate var weather: [Weather]
        
        var firstWeatherUnwrapped: Weather {
            if let first = weather.first {
                return first
            }
            return Weather(main: "Error", description: "Error", icon: "Error")
        }
        
        struct Temperature: Codable {
            var min: Double
            var max: Double
            
        }
        
        struct FeelsLikeTemp: Codable {
            var day: Double
            var night: Double
            var eve: Double
            var morn: Double
        }
    }
    
    struct Weather: Codable {
        var main: String
        var description: String
        var icon: String
    }
    
    
}
