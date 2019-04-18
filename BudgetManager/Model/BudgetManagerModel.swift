//
//  BudgetManagerModel.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/18/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct BudgetManagerModel {
    var yearlyIncome: Double
    var recurringItems : [BudgetItem]
    
    init(yearlyIncome: Double) {
        self.yearlyIncome = yearlyIncome
        recurringItems = [BudgetItem(name: "Housing", amountBudgeted: (yearlyIncome / 12.0) * 0.5),
                          BudgetItem(name: "Groceries", amountBudgeted: (yearlyIncome / 12.0) * 0.25),
                          BudgetItem(name: "Misc", amountBudgeted: (yearlyIncome / 12.0) * 0.25)]
    }
    
    func getRecurringBudgetItems() -> [BudgetItem]{
        return recurringItems
    }

}
