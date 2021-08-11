//
//  HeartRateTableViewCell.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class HeartRateTableViewCell: UITableViewCell {
    @IBOutlet private weak var heartRateLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    lazy private var dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .short
        return f
    }()

    var data: Heartrate? {
        didSet {
            heartRateLabel.text = "\(data?.heartrate ?? -1)"
            
            guard let date = data?.date else { return }
            dateLabel.text = dateFormatter.string(from: date)
        }
    }

}
