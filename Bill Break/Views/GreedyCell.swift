//
//  GreedyCell.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 17.09.2022.
//

import UIKit

class GreedyCell: UITableViewCell {
    
    @IBOutlet weak var cellNumberLabel: UILabel!
    @IBOutlet weak var cellTextfield: UITextField!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    
    var cellNumber: Int?
    var cellTip: String = "10"
    var cellSum: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellNumberLabel.layer.cornerRadius = 5
        cellNumberLabel.layer.masksToBounds = true
        
        //Registering change gesture and naming it "textFieldDidChange"
        self.cellTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    //Storing textfield changes
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        //Do when textfield did change
        if let safeCellNumberLabel = cellNumberLabel.text {
            if let safeCellInt = Int(safeCellNumberLabel) {
                payersArr[safeCellInt - 1].cellSum = cellTextfield.text ?? "0.00"
            }
        }
    }
   
    //Selecting tip
    @IBAction func cellTipSelected(_ sender: UIButton) {
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        sender.isSelected = true
        
        let senderTip = sender.title(for: .normal) ?? "0"
        cellTip = String(senderTip.dropLast())
        
        //Storing data in User Data Array
        if let safeCellNumberLabel = cellNumberLabel.text {
            if let safeCellInt = Int(safeCellNumberLabel){
                payersArr[safeCellInt - 1].cellTip = cellTip
                payersArr[safeCellInt - 1].zeroBool = zeroTip.isSelected
                payersArr[safeCellInt - 1].tenBool = tenTip.isSelected
                payersArr[safeCellInt - 1].twentyBool = twentyTip.isSelected
            }
        }
    }
}
