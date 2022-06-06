//
//  WeatherViewModel.swift
//  weatherDoli
//
//  Created by Nicolas Dolinkue on 05/06/2022.
//

import Foundation
import Combine
import SwiftUI


class WeatherViewModel: ObservableObject {
    
    private var weatherService: Service
    
    @Published var weather = WeatherModel()
    
 
    var cityName: String = ""
    
    
    func search (){
        
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            
            fetchWeather(by: city)
        }
        
    }
    
    
    
    init() {
        
        self.weatherService = Service()
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.fechData(city: city) { weather in
            

                self.weather = weather
            
            
        }
        
    }
    
}
