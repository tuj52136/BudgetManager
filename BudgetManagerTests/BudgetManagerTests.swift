//
//  BudgetManagerTests.swift
//  BudgetManagerTests
//
//  Created by Leo Vergnetti on 4/11/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import XCTest
@testable import BudgetManager

class BudgetManagerTests: XCTestCase {
    var monthlyBudget = MonthlyBudget(income: 1000, perMonth: true)
    
    override func setUp() {
         monthlyBudget = MonthlyBudget(income: 1000, perMonth: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBudgetItemCanBeIntialized(){
        let budgetItem = BudgetItem(name: "Groceries", amountBudgeted : 200)
        XCTAssert(budgetItem.amountBudgeted == 200)
        XCTAssert(budgetItem.name == "Groceries")
    }
    
//    func testMonthlyBudgetCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetTrue() {
//        XCTAssert(monthlyBudget.getMonthlyIncome() == 1000)
//        monthlyBudget = MonthlyBudget(income: 2000, perMonth: true)
//        XCTAssert(monthlyBudget.getMonthlyIncome() == 2000)
//    }
//
//    func testMonthlyBudgetCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetFalse(){
//        var monthlyBudget = MonthlyBudget(income: 12000, perMonth: false)
//        XCTAssert(monthlyBudget.getMonthlyIncome() == 1000)
//        monthlyBudget = MonthlyBudget(income: 24000, perMonth: false)
//        XCTAssert(monthlyBudget.getMonthlyIncome() == 2000)
//    }
//

    func testMonthlyBudgetBudgets50PerCentIncomeForHousingWhenMonthlyIncomeIs1000(){
        monthlyBudget.addBudgetItem(item: BudgetItem(name: "Housing", amountBudgeted: 500))
        let housingBudget = monthlyBudget.getBudgetItem(named: "Housing")!
        XCTAssert(housingBudget.amountBudgeted == 500)
    }

    func testBudgetManagerHasRecurringItemsAfterInit(){
        let yearlyIncome = 24000.0
        let budgetManager = BudgetManagerModel(yearlyIncome: yearlyIncome)
        let recurringItems = [BudgetItem(name: "Housing", amountBudgeted: (yearlyIncome / 12.0) * 0.5),
                                BudgetItem(name: "Groceries", amountBudgeted: (yearlyIncome / 12.0) * 0.25),
                                BudgetItem(name: "Misc", amountBudgeted: (yearlyIncome / 12.0) * 0.25)]
        let budgetedItems = budgetManager.getRecurringBudgetItems()
        recurringItems.forEach{ (item) in
            XCTAssert(budgetedItems.contains(where: {$0.name == item.name}))
        }
        
    }
    
}
