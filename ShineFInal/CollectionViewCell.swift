//
//  CollectionViewCell.swift
//  ShineFInal
//
//  Created by davyngoma on 1/17/17.
//  Copyright © 2017 davyngoma. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var TempType: UILabel!
    @IBOutlet weak var highertemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configureCell(forecast: ForecoastClass) {
        lowTemp.text = "\(forecast.lowTemp)"
        highertemp.text = "\(forecast.highTemp)"
        TempType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        DayLabel.text = forecast.date
    }

}
