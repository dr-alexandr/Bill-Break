//
//  PreGreedyViewController.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 17.09.2022.
//

import Foundation
import UIKit

class PreGreedyViewController: UIViewController {
    
    @IBOutlet weak var stepperView: UILabel!
    
    var payers: Int = 2
    
    override func viewDidLoad() {
        
    }
    
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        stepperView.text = String(Int(sender.value))
        payers = Int(sender.value)
    }
    
    @IBAction func confirmPayersButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GreedySegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GreedySegue" {
            let destinationVC = segue.destination as! GreedyViewController
            destinationVC.payers = payers
        }
    }
    
}
