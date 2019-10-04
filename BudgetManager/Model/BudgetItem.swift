//
//  BudgetItem.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/17/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class BudgetItem {
    var name: String
    var amountBudgeted : Double
    var amountSpent : Double
    
    init(name : String, amountBudgeted : Double, amountSpent : Double) {
        self.name = name
        self.amountBudgeted = amountBudgeted
        self.amountSpent = amountSpent
    }
}
