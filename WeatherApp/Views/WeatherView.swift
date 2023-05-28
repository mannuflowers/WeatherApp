//
//  WeatherView.swift
//  WeatherApp
//
//  Created by asmat manal on 27/05/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        var logoname: String = ""
        if #available(iOS 16.0, *) {
            ZStack(alignment: .leading) {
               
                VStack{
                    if #available(iOS 16.0, *) {
                        VStack(spacing: 10){
                            VStack{
                                if weather.weather[0].main == "Mist"
                                {
                                    let logoname = "drop"
                                    let _ = print("your logo is drop btw")
                                }
                                else
                                {
                                    let logoname = "cloud"
                                }
                                Spacer(minLength: 1)
                                Text(weather.name)
                                    .bold()
                                    .font(.title)
                                
                                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                                    .fontWeight(.light)
                            }
                            .frame(maxWidth: .infinity,alignment: .center)
                            
                            Spacer()
    
                            Image(systemName:"\(logoname)")
                                   .font(.system(size: 190))
                                   .padding(5)
                                
                            Text(" "+weather.main.feelsLike.roundDouble()+"°")
                                .font(.system(size: 100))
                                .bold()
                                .padding(1)
                            
                            Text(weather.weather[0].main)
                                .font(.system(size: 25))
                                .padding(1)
                            Spacer(minLength: 10)
                        }
                        .padding()
                        .frame(maxWidth: .infinity,maxHeight: 570,alignment: .leading)
                        .background(in: RoundedRectangle(cornerRadius: 2)
                            .inset(by: -10))
                        .backgroundStyle(.blue.gradient)
                        .cornerRadius(50, corners:[.topLeft,.topRight,.bottomLeft,.bottomRight])
                    } else {
                        // Fallback on earlier versions
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("weather now")
                            .bold()
                            .font(.title)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        HStack(spacing: 5){
                            Spacer()

                            WeatherColumn(logo: "thermometer.low", name: "min temp", value: weather.main.temp_min.roundDouble()+"°")
                            Spacer()
                            WeatherColumn(logo: "thermometer.high", name: "max temp", value: weather.main.temp_max.roundDouble()+"°")
                            Spacer()
                            WeatherColumn(logo: "wind", name: "wind speed", value: weather.wind.speed.roundDouble(),sub: "m/s")
                            Spacer()
                            WeatherColumn(logo: "humidity", name: "humidity", value: weather.main.humidity.roundDouble(),sub: "%")
                            Spacer()

                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(in: RoundedRectangle(cornerRadius: 2)
                        .inset(by: -10))
                    .backgroundStyle(.yellow.gradient)
                    .cornerRadius(50, corners:[.topLeft,.topRight])
                }

                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.bottom)


            }
            
            .background(in: RoundedRectangle(cornerRadius: 2)
                .inset(by: -10))
            .backgroundStyle(.black.gradient)
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
//            .ignoresSafeArea()

        } else {
            // Fallback on earlier versions
        }
   
}
       
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
