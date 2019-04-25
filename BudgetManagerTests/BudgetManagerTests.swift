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
    var monthlyBudget = MonthlyBudget(income: 1000)
    
    override func setUp() {
         monthlyBudget = MonthlyBudget(income: 1000)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBudgetItemCanBeIntialized(){
        let budgetItem = BudgetItem(name: "Groceries", amountBudgeted : 200)
        XCTAssert(budgetItem.amountBudgeted == 200)
        XCTAssert(budgetItem.name == "Groceries")
    }
    
    func testMonthlyBudgetCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetTrue() {
        XCTAssert(monthlyBudget.getMonthlyIncome() == 1000)
        monthlyBudget = MonthlyBudget(income: 2000)
        XCTAssert(monthlyBudget.getMonthlyIncome() == 2000)
    }

    func testMonthlyBudgetBudgets50PerCentIncomeForHousingWhenMonthlyIncomeIs1000(){
        monthlyBudget.addBudgetItem(item: BudgetItem(name: "Housing", amountBudgeted: 500))
        let housingBudget = monthlyBudget.getBudgetItem(named: "Housing")!
        XCTAssert(housingBudget.amountBudgeted == 500)
    }

    func testBudgetManagerHasRecurringItemsAfterInit(){
        let monthlyIncome = 2000.0
        let budgetManager = BudgetManagerModel(monthlyIncome: monthlyIncome)
        let recurringItems = [BudgetItem(name: "Housing", amountBudgeted: monthlyIncome * 0.5),
                                BudgetItem(name: "Groceries", amountBudgeted: monthlyIncome  * 0.25),
                                BudgetItem(name: "Misc", amountBudgeted: monthlyIncome * 0.25)]
        let budgetedItems = budgetManager.getRecurringBudgetItems()
        recurringItems.forEach{ (item) in
            XCTAssert(budgetedItems.contains(where: {$0.name == item.name}))
        }
    }
    
    //Test we can get a monthly budget from budget manager
    
}
