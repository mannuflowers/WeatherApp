//
//  WeatherColumn.swift
//  WeatherApp
//
//  Created by asmat manal on 28/05/23.
//

import SwiftUI

struct WeatherColumn: View {
    
    var logo: String
    var name: String
    var value: String
    var sub: String?
    
    var body: some View {
        if #available(iOS 16.0, *) {
            VStack{
                Image(systemName: logo)
                    .font(.title2)
                    .frame(width: 20,height: 20)
                    .padding()
                    .background(.white)
                    .cornerRadius(50)
                    .foregroundColor(.blue)
                VStack{
                    Text(name)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                    HStack{
                        Text(value)
                            .bold()
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(sub ?? "")
                            .fontWeight(.light)
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                    }
                    .multilineTextAlignment(.center)
                }
            }
            .multilineTextAlignment(.center)
            .padding(10)
            .background(in: RoundedRectangle(cornerRadius: 2)
                .inset(by: -10))
            .backgroundStyle(.blue.gradient)
            .cornerRadius(20, corners:[.topLeft,.topRight,.bottomLeft,.bottomRight])
        } else {
            // Fallback on earlier versions
        }
    }
}

struct WeatherColumn_Previews: PreviewProvider {
    static var previews: some View {
        WeatherColumn(logo: "thermometer", name: "feels like", value: "8")
    }
}
