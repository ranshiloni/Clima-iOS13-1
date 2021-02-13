//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    // What should we do when the user pressed return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            searchTextField.endEditing(true)
            return true
        } else {
            textField.placeholder = "Type a city name 🌃"
            return false
        }
    }

    @IBAction func seachPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // another way to unwrap optionals
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

