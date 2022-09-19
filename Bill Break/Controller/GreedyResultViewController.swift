//
//  GreedyResultViewController.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 19.09.2022.
//

import Foundation
import UIKit

class GreedyResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerTableViewCells()
    }
    
    // MARK: - Table View Setup
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GreedyResultCell") as? GreedyResultCell {
            
            cell.numberLabel.text = String(payersArr[indexPath.row].cellNumber)
            
            if let cellSum = Double(payersArr[indexPath.row].cellSum) {
                if let cellTip = Double(payersArr[indexPath.row].cellTip) {
                    let result = cellSum + (cellSum * (cellTip / 100))
                    cell.calculatedResult.text = String(format: "%.2f", result)
                }
            } else {
                cell.calculatedResult.text = "0.00"
            }
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let resultGreedyCell = UINib(nibName: "GreedyResultCell",
                                  bundle: nil)
        self.tableView.register(resultGreedyCell,
                                forCellReuseIdentifier: "GreedyResultCell")
    }
    
    
    
    // MARK: - Recalculate Button

    @IBAction func resultRecalculatePressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        //Clear User Data
        payersArr.removeAll()
    }
    
}
