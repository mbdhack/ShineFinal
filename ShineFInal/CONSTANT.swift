//
//  CONSTANT.swift
//  ShineFInal
//
//  Created by davyngoma on 1/7/17.
//  Copyright © 2017 davyngoma. All rights reserved.
//

import Foundation

typealias DownloadCompleted = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=27cab5e1dd6477f5d870718d543e1db5"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=16&mode=json&appid=27cab5e1dd6477f5d870718d543e1db5"


let WeatherImageBackgrounD = ["CloudsWeatherBackground","ClearWeatherBackground","RainWeatherBackground"]
