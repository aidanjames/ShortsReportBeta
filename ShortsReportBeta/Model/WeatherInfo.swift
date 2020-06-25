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
        var windDeg: Double
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



enum MockData {

    static func weatherPreviewData() -> OneCallWeather {
        let weather = OneCallWeather.Weather(main: "Clear", description: "clear sky", icon: "01n")
        let current = OneCallWeather.WeatherSituation(dt: 1560350192, temp: 298.99, feelsLike: 285.98, humidity: 93, windSpeed: 0.47, windDeg: 107.538, weather: [weather])

        let temp = OneCallWeather.DailyWeatherSituation.Temperature(min: 281.52, max: 295.56)
        let feelsLikeTemp = OneCallWeather.DailyWeatherSituation.FeelsLikeTemp(day: 296.45, night: 285.42, eve: 289.41, morn: 281.45)
        let dailyWeather = OneCallWeather.DailyWeatherSituation(dt: 1560350192, temp: temp, feelsLike: feelsLikeTemp, humidity: 90, windSpeed: 0.25, windDeg: 107.538, weather: [weather])
        
        return OneCallWeather(current: current, hourly: [current], daily: [dailyWeather])
    }
    
    
//    static func previewData() -> WeatherInfo {
//        WeatherInfo(weather: [WeatherInfo.Weather(main: "Clear", description: "clear sky", icon: "01d")], main: WeatherInfo.Main(temp: 281.52, feelsLike: 278.99), wind: WeatherInfo.Wind(speed: 0.47), name: "Shuzen")
//    }

}
