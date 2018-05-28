//
//  CollectionViewController.swift
//  ShineFInal
//
//  Created by davyngoma on 1/17/17.
//  Copyright © 2017 davyngoma. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import AVKit
import AVFoundation
import MediaPlayer



let Identifier = "CellWeather"
class CollectionViewController:  UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate{
    
     @IBOutlet weak var UIviewVideo: UIView!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var cityLAbel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var collectiobview: UICollectionView!

    var currentWeather: CurrentWeather!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var forecasts = [ForecoastClass]()
    var player :AVPlayer?
    var forcecast: ForecoastClass!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        collectiobview.delegate = self
        collectiobview.dataSource = self
        currentWeather = CurrentWeather()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            print(Location.sharedInstance.latitude = currentLocation.coordinate.latitude)
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                        self.uptadeUi()
                        self.playVideo()
                        self.loopVideo()
                    DispatchQueue.main.async {
                        self.collectiobview.reloadData()
                    }
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    func downloadForecastData(completed: @escaping DownloadCompleted) {
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = ForecoastClass(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.collectiobview.reloadData()
                }
            }
            completed()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
