//
//  BudgetManagerModel.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/18/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct BudgetManagerModel {
    var monthlyIncome: Double
    var recurringItems : [BudgetItem]
    var updatedBudgets = [MonthlyBudget]()
    
    init(monthlyIncome: Double) {
        self.monthlyIncome = monthlyIncome
        recurringItems = [BudgetItem(name: "Housing", amountBudgeted: (monthlyIncome / 12.0) * 0.5),
                          BudgetItem(name: "Groceries", amountBudgeted: (monthlyIncome / 12.0) * 0.25),
                          BudgetItem(name: "Misc", amountBudgeted: (monthlyIncome / 12.0) * 0.25)]
    }
    
    func getRecurringBudgetItems() -> [BudgetItem]{
        return recurringItems
    }
    
    
}
