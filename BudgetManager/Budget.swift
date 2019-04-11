//
//  Budget.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct Budget {
    
    private var monthlyIncome : Double
    private var budgetItems = ["Groceries" : 250.0, "Housing" : 500, "Leisure" : 100, "Phone" : 50, "Electric" : 50, "Savings" : 50]
    
    init(income: Double, perMonth: Bool) {
        monthlyIncome = perMonth ? income : income / 12
    }
    
    func getMonthlyIncome() -> Double{
        return monthlyIncome
    }
    
    func getListOfMonthlyBudgetItems() -> [String]{
        return Array(budgetItems.keys)
    }
    
    func getBudgetedAmount(for item: String) -> Double? {
        return budgetItems[item]
    }
}
