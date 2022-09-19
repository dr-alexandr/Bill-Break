//
//  GreedyViewController.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 17.09.2022.
//

import Foundation
import UIKit
import NotificationCenter

class GreedyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var payers: Int?
    
    override func viewDidLoad() {
        
        //TableView setup
        tableView.backgroundColor = UIColor(named: "Accent Yellow")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerTableViewCells()
        
        //Hide keyboard func setup
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        //Keyboard goes upwards
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Clear User Data
        payersArr.removeAll()
        
        //Setting empty User Data Slots
        if let safePayers = payers {
            for n in 0...safePayers - 1 {
                payersArr.append(GreedyUser(number: n + 1, tip: "10", sum: "", zeroBool: false, tenBool: true, twentyBool: false))
            }
        }
        
    }
    
// MARK: - Keyboard Setup
    
    //Textfield moves up
    @objc func keyboardWillShow(notification: Notification) {
    //with line below ,we can get the keyboard size.
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height - 80, right: 0)
        }
    }
    
    //Textfield moves down
    @objc func keyboardWillHide(notification: Notification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    //Hide keyboard func setup
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
// MARK: - Recalulate Button
    
    @IBAction func greedyRecalculatePressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        //Clear User Data
        payersArr.removeAll()
    }

// MARK: - Table View Control
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payers ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GreedyCell") as? GreedyCell {
            cell.cellNumberLabel.text = "\(indexPath.row + 1)"
            
            cell.cellTextfield.text = payersArr[indexPath.row].cellSum
            cell.zeroTip.isSelected = payersArr[indexPath.row].zeroBool
            cell.tenTip.isSelected = payersArr[indexPath.row].tenBool
            cell.twentyTip.isSelected = payersArr[indexPath.row].twentyBool
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let greedyCell = UINib(nibName: "GreedyCell",
                                  bundle: nil)
        self.tableView.register(greedyCell,
                                forCellReuseIdentifier: "GreedyCell")
    }
    
}
