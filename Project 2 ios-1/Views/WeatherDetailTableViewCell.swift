//
//  WeatherDetailTableViewCell.swift
//  Project 2 ios-1
//
//  Created by Andrew Ananda on 28/11/2023.
//

import UIKit

class WeatherDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDesctiption: UILabel!
    
    private var isCelsius: Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setUpCell(item : WeatherResponse, isCelsius: Bool) {
        weatherImage.image = UIImage(systemName: item.current.condition.conditionName)
        lblLocation.text = item.location.name
        lblDesctiption.text = "\(item.current.condition.text)  \(self.isCelsius ? "\(item.current.temp_c)°C" : "\(item.current.temp_f)°F")"
    }
    
    
}
