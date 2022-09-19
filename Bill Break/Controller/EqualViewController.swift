//
//  ViewController.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 13.09.2022.
//

import UIKit

class EqualViewController: UIViewController {

    @IBOutlet weak var totalBillTextField: UITextField!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    @IBOutlet weak var stepperView: UILabel!
    
    var totalBill: Double = 0
    var tip: String = "0"
    var split: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        totalBill = 0
        tip = "10"
        split = 2
        
        //To dissmiss keyboard when touching the screen anywhere else
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func tipSelected(_ sender: UIButton) {
        
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
        
        let senderTip = sender.title(for: .normal) ?? "0"
        tip = String(senderTip.dropLast())
        
    }
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        stepperView.text = String(Int(sender.value))
        split = Int(sender.value)
    }
    
    @IBAction func goToResult(_ sender: UIButton) {
        
        if let safeText = totalBillTextField.text {
            totalBill = Double(safeText) ?? 0.00
            totalBill = Double(round(100 * totalBill) / 100)
        }
        
        performSegue(withIdentifier: "goToResultSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultSegue" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.persons = split
            destinationVC.tip = tip
            destinationVC.totalPerPerson = (totalBill + (totalBill * (Double(tip)! / 100))) / Double(split)
        }
    }
    
    
}

