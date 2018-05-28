//
//  CollectionExtension.swift
//  ShineFInal
//
//  Created by davy ngoma mbaku on 5/27/18.
//  Copyright © 2018 davyngoma. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation
import MediaPlayer



extension  CollectionViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecasts.count
    }
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectiobview.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return CollectionViewCell()
        }
    }
    func uptadeUi(){
        currentDateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherLabel.text  = currentWeather.weatherType
        cityLAbel.text = "\(currentWeather.cityName)"
    }
    func playVideo(){
        WeatherTypeVideo.videoData.forEach { (video) in
            guard video == currentWeather.weatherType else {return}
            print(video)
            let videoUrl = Bundle.main.url(forResource: "\(video)", withExtension: "mp4")!
            self.player = AVPlayer.init(url: videoUrl)
            self.player?.actionAtItemEnd = .none
            self.player?.isMuted = true
            let playerlayer = AVPlayerLayer(player:player)
            playerlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            playerlayer.zPosition = -1
            playerlayer.frame = view.frame
            UIviewVideo.layer.addSublayer(playerlayer)
            player?.play()
            NotificationCenter.default.addObserver(self, selector:#selector(CollectionViewController.loopVideo), name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        }
    }
    func loopVideo() {
        player?.seek(to:kCMTimeZero)
        player?.play()
    }
    
//    func setBackgroundVideo() {
//        if weatherTypeIMage.Clear == currentWeather.weatherType {
//            self.weatherTypeBAckground.image = UIImage(named:"ClearWeatherBackground")
//        } else if weatherTypeIMage.cloud == currentWeather.weatherType {
//            self.weatherTypeBAckground.image = UIImage(named: "CloudsWeatherBackground")
//        } else if weatherTypeIMage.rain == currentWeather.weatherType {
//            self.weatherTypeBAckground.image = UIImage(named: "RainWeatherBackground")
//        }else if weatherTypeIMage.Thunderstorm == currentWeather.weatherType{
//            self.weatherTypeBAckground.image = UIImage(named: "ThunderstormWeatherBackground")
//        }
//        else{
//            self.weatherTypeBAckground.image = UIImage(named:"RainWeatherBackground")
//        }
//    }
    
    
}
