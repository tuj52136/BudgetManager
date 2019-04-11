//
//  Budget.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Budget {
    
    var monthlyIncome : Double
    
    init(income: Double, perMonth: Bool) {
        monthlyIncome = perMonth ? income : income / 12
    }
    
    func getMonthlyIncome() -> Double{
        return monthlyIncome
    }
}
