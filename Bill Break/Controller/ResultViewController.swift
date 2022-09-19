//
//  ResultViewController.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 14.09.2022.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var totalPerPerson: Double?
    var persons: Int?
    var tip: String?
    var roundedAmount: String?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let total = totalPerPerson {
            roundedAmount = String(format: "%.2f", Double(round(100 * total) / 100))
            
        }
        
        if roundedAmount != "0.00" {
            totalLabel.text = roundedAmount
            commentLabel.text = "Each of you should pay \(roundedAmount ?? "")"
        } else {
            titleLabel.isHidden = true
            totalLabel.text = "You fucked up ..."
            commentLabel.text = "You forgot to mention your bill total"
        }
        
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}

