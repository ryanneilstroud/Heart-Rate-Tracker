//
//  HeartRatesViewController.swift
//  Heart Rate Tracker
//
//  Created by Ryan Neil Stroud on 10/8/2021.
//

import UIKit

class HeartRatesViewController: BaseViewController {
    typealias Action = () -> Void
    
    @IBOutlet weak var tableView: UITableView!
    
    var heartrates: [Heartrate] = []
    var takeHeartRate: Action?
    var logout: Action?
    
    @IBAction func takeHeartRate(_ sender: FloatingButton) {
        takeHeartRate?()
    }
    @IBAction func logout(_ sender: UIBarButtonItem) {
        logout?()
    }
}

extension HeartRatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heartrates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeartRateTableViewCell.self), for: indexPath) as? HeartRateTableViewCell else {
            return UITableViewCell()
        }
        cell.data = heartrates[indexPath.row]
        
        return cell
    }
}
