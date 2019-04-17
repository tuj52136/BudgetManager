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
    var budgetManager = MonthlyBudget(income: 1000, perMonth: true)
    
    override func setUp() {
         budgetManager = MonthlyBudget(income: 1000, perMonth: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBudgetItemCanBeIntialized(){
        let budgetItem = BudgetItem(name: "Groceries", amountBudgeted : 200)
        XCTAssert(budgetItem.amountBudgeted == 200)
        XCTAssert(budgetItem.name == "Groceries")
    }
    
    func testBudgetManagerCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetTrue() {
        XCTAssert(budgetManager.getMonthlyIncome() == 1000)
        budgetManager = MonthlyBudget(income: 2000, perMonth: true)
        XCTAssert(budgetManager.getMonthlyIncome() == 2000)
    }

    func testBudgetManagerCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetFalse(){
        var budgetManager = MonthlyBudget(income: 12000, perMonth: false)
        XCTAssert(budgetManager.getMonthlyIncome() == 1000)
        budgetManager = MonthlyBudget(income: 24000, perMonth: false)
        XCTAssert(budgetManager.getMonthlyIncome() == 2000)
    }
    

    func testBudgetManagerBudgets50PerCentIncomeForHousingWhenMonthlyIncomeIs1000(){
        budgetManager.addBudgetItem(item: BudgetItem(name: "Housing", amountBudgeted: 500))
        let housingBudget = budgetManager.getBudgetItem(named: "Housing")!
        XCTAssert(housingBudget.amountBudgeted == 500)
    }
    
}
