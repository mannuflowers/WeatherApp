//
//  WelcomeScreenView.swift
//  WeatherApp
//
//  Created by asmat manal on 27/05/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeScreenView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                
                Text("please share your location to be able to fetch the weather details in your area")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .foregroundColor(.white)
            .symbolVariant(.fill)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
