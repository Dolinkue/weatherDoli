//
//  ContentView.swift
//  weatherDoli
//
//  Created by Nicolas Dolinkue on 05/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        ZStack{
        
            Image("light_background")
                .resizable()
                
                .ignoresSafeArea()
            
            VStack() {
            
                TextField("Enter City", text: self.$weatherVM.cityName) {
                    self.weatherVM.search()
                }
                .autocapitalization(.none)
                .background()
                .padding()
                
                
                
                Image(systemName:weatherVM.weather.weather?[0].conditionName ?? "cloud.bolt")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.white)
                
                
                
                Text(weatherVM.weather.main?.temperatureString ?? "20")
                
                
            }.padding()
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
