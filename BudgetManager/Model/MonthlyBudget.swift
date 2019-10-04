//
//  Budget.swift
//  MonthlyBudget
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import Foundation

class MonthlyBudget {
    private var month: DateComponents?
    private var incomeForTheMonth : Double
    var budgetItems = [BudgetItem]()
    
    init(income: Double) {
        incomeForTheMonth = income
    }
    
    func getTotalAmountBudgeted() -> Double {
        return budgetItems.reduce(0){$0 + $1.amountBudgeted}
    }
    
    func getTotalAmountSpent() -> Double {
        return budgetItems.reduce(0){$0 + $1.amountSpent}
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
    
    func addBudgetItem(item : BudgetItem) {
        budgetItems.append(item)
    }
    
    func spend(amount : Double, onItemNamed name: String) {
        budgetItems.forEach{
            if $0.name == name {
                $0.amountSpent += amount
                print("spent from in budget :\(amount)")
            }
        }
    }
}
