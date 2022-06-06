//
//  Service.swift
//  weatherDoli
//
//  Created by Nicolas Dolinkue on 05/06/2022.
//

import Foundation


struct Service {
    
    
    
    func fechData(city: String, completion: @escaping(WeatherModel) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=4227ede7bf3a3abaa9ff3cc467b3ea15&units=metric&q=\(city)") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            
            do {
                
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    
                    print(weather)
                    completion(weather)
                    
                }
                
                
            } catch {
                
            
                let error = error
                print(error)
                
                
            }
            
        }.resume()
    }
}
