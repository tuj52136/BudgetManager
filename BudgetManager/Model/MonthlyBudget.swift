//
//  Budget.swift
//  MonthlyBudget
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

struct MonthlyBudget {
    private var month: DateComponents?
    private var incomeForTheMonth : Double
    private var budgetItems = [BudgetItem]()
    
    init(income: Double) {
        incomeForTheMonth = income
    }
    
    func getMonthlyIncome() -> Double{
        return incomeForTheMonth
    }
    
    func getListOfMonthlyBudgetItems() -> [BudgetItem]{
        return budgetItems
    }
    
    func getBudgetItem(named name: String) -> BudgetItem? {
        var foundItem : BudgetItem? = nil
        budgetItems.forEach{
            if $0.name == name {
                foundItem = $0
            }
        }
        return foundItem
    }
    
    mutating func addBudgetItem(item : BudgetItem) {
        budgetItems.append(item)
    }
}
