//
//  File.swift
//  weatherDoli
//
//  Created by Nicolas Dolinkue on 05/06/2022.
//

import Foundation


struct WeatherModel: Decodable {
    var name: String?
    var main: Main?
    var weather: [Weather]?
}

struct Main: Decodable {
    let temp: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temp)
    }
    
    
}

struct Weather: Decodable {
    let description: String
    let id: Int
    
    var conditionName: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
    
    
    
}
