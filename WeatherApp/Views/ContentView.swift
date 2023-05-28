//
//  ContentView.swift
//  WeatherApp
//
//  Created by asmat manal on 27/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack {
                
                if let location = locationManager.location {
                    if let weather = weather {
                        Text("weather data fetched!")
                        WeatherView(weather: weather)
                        //print("\(location.latitude),\(location.longitude)")
                    }
                    else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                }
                                catch {
                                    print("error fetching weather:\(error)")
                                }
                            }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeScreenView().environmentObject(locationManager)
                    }
                }
                
            }
            .background(in: RoundedRectangle(cornerRadius: 2)
                .inset(by: -10))
            .backgroundStyle(.black.gradient)
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
