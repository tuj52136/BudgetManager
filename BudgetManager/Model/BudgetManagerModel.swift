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
    var currentMonthBudget = MonthlyBudget(income: 0.0)
    
    
    init(monthlyIncome: Double) {
        self.monthlyIncome = monthlyIncome
        recurringItems = [BudgetItem(name: "Housing", amountBudgeted: monthlyIncome * 0.5, amountSpent:  0.0),
                          BudgetItem(name: "Groceries", amountBudgeted: (monthlyIncome) * 0.25, amountSpent: 0.0),
                          BudgetItem(name: "Misc", amountBudgeted: (monthlyIncome) * 0.25, amountSpent: 0.0)]
       
        currentMonthBudget = MonthlyBudget(income: monthlyIncome)
        currentMonthBudget.budgetItems = recurringItems
    }
    
    func getRecurringBudgetItems() -> [BudgetItem]{
        return recurringItems
    }
    
    func getTotalAmountBudgeted() -> Double {
        return recurringItems.reduce(0){$0 + $1.amountBudgeted}
    }
    
    mutating func addRecurringItem(named name: String, amount: Double){
        let itemToAdd = BudgetItem(name: name.capitalized, amountBudgeted: amount, amountSpent: 0.0)
        recurringItems.append(itemToAdd)
        currentMonthBudget.addBudgetItem(item: itemToAdd)
    }
    
    mutating func deleteRecurringItem(item: BudgetItem){
        recurringItems.removeAll(where: {$0.name == item.name})
    }
}
