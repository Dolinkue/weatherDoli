//
//  ContentView.swift
//  weatherDoli
//
//  Created by Nicolas Dolinkue on 05/06/2022.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    @State var city: String = ""
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        ZStack{
        
            Image("light_background")
                .resizable()
                
                .ignoresSafeArea()
            
            VStack() {
                
                
                Text(weatherVM.weather.name ?? "City")
                    .font(.custom("Arial", size: 80))
                    .foregroundColor(.white)
                    .offset(y: -130)
                    .padding()
            
                TextField("Enter City", text: self.$city)
                    .padding()
                    .autocapitalization(.none)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .offset(y: -100)
                   
                    
                    
                Button("Search") {
                    
                    self.weatherVM.cityName = city
                    self.weatherVM.search()
                    self.city = ""
                    
                    
                    
                }
                    .font(.custom("Arial", size: 40))
                    .foregroundColor(.white)
                    .offset(y: -50)
                    .padding()
                    
                    
                
                
                
                
                Image(systemName:weatherVM.weather.weather?[0].conditionName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color.white)
                
                
                
                Text(weatherVM.weather.main?.temperatureString ?? "")
                    .font(.custom("Arial", size: 80))
                    .foregroundColor(.white)
                    .offset(y: 80)
                    .padding()
                    
                
                
            }.padding()
            

        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
