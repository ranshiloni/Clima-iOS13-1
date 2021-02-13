//
//  File.swift
//  Clima
//
//  Created by Ran on 07/02/2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=6a7d433d7fb1a765c1ce5c7056d06b51&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                    
                }
                    if let safeData = data {
                        parseJSON(weatherData: safeData) // might need to add self.
                    }
                }
                
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].id)
        } catch {
            print(error)
        }
        
        
    }
    
    func getConditionBame(weatherId: Int) -> String {
        switch weatherId {
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
