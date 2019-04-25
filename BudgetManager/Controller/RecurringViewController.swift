//
//  RecurringViewController.swift
//  BudgetManager
//
//  Created by Leo Vergnetti on 4/25/19.
//  Copyright © 2019 Leo Vergnetti. All rights reserved.
//

import UIKit

class RecurringViewController: UIViewController {

     var budgetManager = BudgetManagerModel(monthlyIncome: 0.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(budgetManager.monthlyIncome)
    }
    


}
