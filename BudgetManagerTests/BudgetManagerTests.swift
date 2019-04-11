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
    var budgetManager = Budget(income: 1000, perMonth: true)
    
    override func setUp() {
         budgetManager = Budget(income: 1000, perMonth: true)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBudgetManagerCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetTrue() {
        XCTAssert(budgetManager.getMonthlyIncome() == 1000)
        budgetManager = Budget(income: 2000, perMonth: true)
        XCTAssert(budgetManager.getMonthlyIncome() == 2000)
    }

    func testBudgetManagerCallToGetMonthlyIncomeReturnsAmountInInitializerWhenPerMonthSetFalse(){
        var budgetManager = Budget(income: 12000, perMonth: false)
        XCTAssert(budgetManager.getMonthlyIncome() == 1000)
        budgetManager = Budget(income: 24000, perMonth: false)
        XCTAssert(budgetManager.getMonthlyIncome() == 2000)
    }
    
    func testBudgetManagerHasBudgetedInListOfBudgetItems(){
        let listOfMonthlyBudgetItems = ["Groceries", "Housing", "Leisure", "Phone", "Electric", "Savings"]
        for item in listOfMonthlyBudgetItems {
            XCTAssert(budgetManager.getListOfMonthlyBudgetItems().contains(item))
        }
    }
    
    func testBudgetManagerBudgets50PerCentIncomeForHousingWhenMonthlyIncomeIs1000(){
        let housingBudget = budgetManager.getBudgetedAmount(for: "Housing")
        XCTAssert(housingBudget == 500)
    }
    
    func testBudgetManagerBudgetBudgets25PerCentIncomeForGroceriesWhenMonthlyIncomeIs1000(){
        let groceriesBudget = budgetManager.getBudgetedAmount(for: "Groceries")
        XCTAssert(groceriesBudget == 250)
    }

}
