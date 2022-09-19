//
//  GreedyUser.swift
//  Bill Break
//
//  Created by Dr.Alexandr on 18.09.2022.
//

import Foundation

struct GreedyUser {
    
    let cellNumber: Int
    var cellTip: String
    var cellSum: String
    var zeroBool: Bool
    var tenBool: Bool
    var twentyBool: Bool
    
    init(number: Int, tip: String, sum: String, zeroBool: Bool, tenBool: Bool, twentyBool: Bool) {
        self.cellNumber = number
        self.cellTip = tip
        self.cellSum = sum
        self.zeroBool = zeroBool
        self.tenBool = tenBool
        self.twentyBool = twentyBool
    }
    
}
